<?php

declare(strict_types=1);

namespace App\Modules\Home\Controllers;

use App\Core\Database\Database;
use PDO;

class HomeController
{
    public function index(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $ajaxAction = trim((string) ($_GET['ajax'] ?? ''));
        if ($ajaxAction === 'job_detail') {
            header('Content-Type: text/html; charset=UTF-8');
            $selectedJob = $this->findJobById((int) ($_GET['job'] ?? 0));
            require base_path('app/Views/home/_job_detail.php');
            return;
        }

        $title = 'Find Jobs';
        $keyword = trim((string) ($_GET['q'] ?? ''));
        $location = trim((string) ($_GET['l'] ?? ''));
        $selectedId = (int) ($_GET['job'] ?? 0);

        $jobs = $this->findJobs($keyword, $location);
        if ($selectedId > 0) {
            $selectedJob = $this->findJobById($selectedId);
            if ($selectedJob !== null) {
                $jobs = $this->ensureJobPresent($jobs, $selectedJob);
            }
        } else {
            $selectedJob = $this->resolveSelectedJob($jobs, 0);
        }

        ob_start();
        require base_path('app/Views/home/index.php');
        $content = (string) ob_get_clean();
        require base_path('app/Views/layouts/main.php');
    }

    /**
     * @return array<int, array<string, mixed>>
     */
    private function findJobs(string $keyword, string $location): array
    {
        $db = Database::connect();

        $sql = <<<'SQL'
SELECT
    jp.job_post_id,
    jp.job_title,
    jp.job_location,
    jp.city,
    jp.state_code,
    jp.work_mode,
    jp.description_text,
    jp.qualifications,
    jp.benefits,
    jp.pay_rate_min,
    jp.pay_rate_max,
    jp.pay_interval,
    jp.created_utc,
    COALESCE(NULLIF(TRIM(a.accName), ''), NULLIF(TRIM(a.officeName), ''), CONCAT('Account #', jp.account_id)) AS company_name
FROM job_posts jp
LEFT JOIN accounts a ON a.account_id = jp.account_id
WHERE jp.active = 1
  AND jp.created_utc >= DATE_SUB(UTC_TIMESTAMP(), INTERVAL 3 MONTH)
SQL;

        $params = [];

        if ($keyword !== '') {
            $sql .= ' AND (jp.job_title LIKE :keyword_title OR jp.description_text LIKE :keyword_description OR a.accName LIKE :keyword_company)';
            $keywordLike = '%' . $keyword . '%';
            $params['keyword_title'] = $keywordLike;
            $params['keyword_description'] = $keywordLike;
            $params['keyword_company'] = $keywordLike;
        }

        if ($location !== '') {
            $sql .= ' AND (jp.job_location LIKE :location_full OR jp.city LIKE :location_city OR jp.state_code LIKE :location_state)';
            $locationLike = '%' . $location . '%';
            $params['location_full'] = $locationLike;
            $params['location_city'] = $locationLike;
            $params['location_state'] = $locationLike;
        }

        $sql .= ' ORDER BY jp.created_utc DESC';

        $stmt = $db->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    /**
     * @param array<int, array<string, mixed>> $jobs
     * @return array<string, mixed>|null
     */
    private function resolveSelectedJob(array $jobs, int $selectedId): ?array
    {
        if ($jobs === []) {
            return null;
        }

        if ($selectedId <= 0) {
            return $jobs[0];
        }

        foreach ($jobs as $job) {
            if ((int) ($job['job_post_id'] ?? 0) === $selectedId) {
                return $job;
            }
        }

        return null;
    }

    /**
     * @return array<string, mixed>|null
     */
    private function findJobById(int $jobId): ?array
    {
        if ($jobId <= 0) {
            return null;
        }

        $db = Database::connect();

        $sql = <<<'SQL'
SELECT
    jp.job_post_id,
    jp.job_title,
    jp.job_location,
    jp.city,
    jp.state_code,
    jp.work_mode,
    jp.description_text,
    jp.qualifications,
    jp.benefits,
    jp.pay_rate_min,
    jp.pay_rate_max,
    jp.pay_interval,
    jp.created_utc,
    COALESCE(NULLIF(TRIM(a.accName), ''), NULLIF(TRIM(a.officeName), ''), CONCAT('Account #', jp.account_id)) AS company_name
FROM job_posts jp
LEFT JOIN accounts a ON a.account_id = jp.account_id
WHERE jp.active = 1
  AND jp.created_utc >= DATE_SUB(UTC_TIMESTAMP(), INTERVAL 3 MONTH)
  AND jp.job_post_id = :job_post_id
LIMIT 1
SQL;

        $stmt = $db->prepare($sql);
        $stmt->execute(['job_post_id' => $jobId]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ?: null;
    }

    /**
     * @param array<int, array<string, mixed>> $jobs
     * @param array<string, mixed> $selectedJob
     * @return array<int, array<string, mixed>>
     */
    private function ensureJobPresent(array $jobs, array $selectedJob): array
    {
        $selectedId = (int) ($selectedJob['job_post_id'] ?? 0);
        if ($selectedId <= 0) {
            return $jobs;
        }

        foreach ($jobs as $job) {
            if ((int) ($job['job_post_id'] ?? 0) === $selectedId) {
                return $jobs;
            }
        }

        array_unshift($jobs, $selectedJob);

        return $jobs;
    }
}
