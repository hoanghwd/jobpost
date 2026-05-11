<?php

declare(strict_types=1);

namespace App\Modules\Home\Controllers;

use App\Core\Database\Database;
use PDO;

class HomeController
{
    public function index(): void
    {
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
        $selectedJob = $this->resolveSelectedJob($jobs, $selectedId);

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
    jp.channel_type,
    jp.workflow_type,
    jp.description_text,
    jp.created_utc,
    COALESCE(NULLIF(TRIM(a.accName), ''), NULLIF(TRIM(a.officeName), ''), CONCAT('Account #', jp.account_id)) AS company_name
FROM job_posts jp
LEFT JOIN accounts a ON a.account_id = jp.account_id
WHERE jp.active = 1
SQL;

        $params = [];

        if ($keyword !== '') {
            $sql .= ' AND (jp.job_title LIKE :keyword OR jp.description_text LIKE :keyword OR a.accName LIKE :keyword)';
            $params['keyword'] = '%' . $keyword . '%';
        }

        if ($location !== '') {
            $sql .= ' AND (jp.job_location LIKE :location OR jp.city LIKE :location OR jp.state_code LIKE :location)';
            $params['location'] = '%' . $location . '%';
        }

        $sql .= ' ORDER BY jp.created_utc DESC LIMIT 100';

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

        foreach ($jobs as $job) {
            if ((int) ($job['job_post_id'] ?? 0) === $selectedId) {
                return $job;
            }
        }

        return $jobs[0];
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
    jp.channel_type,
    jp.workflow_type,
    jp.description_text,
    jp.created_utc,
    COALESCE(NULLIF(TRIM(a.accName), ''), NULLIF(TRIM(a.officeName), ''), CONCAT('Account #', jp.account_id)) AS company_name
FROM job_posts jp
LEFT JOIN accounts a ON a.account_id = jp.account_id
WHERE jp.active = 1 AND jp.job_post_id = :job_post_id
LIMIT 1
SQL;

        $stmt = $db->prepare($sql);
        $stmt->execute(['job_post_id' => $jobId]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ?: null;
    }
}
