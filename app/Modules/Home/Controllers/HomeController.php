<?php

declare(strict_types=1);

namespace App\Modules\Home\Controllers;

use App\Core\Database\Database;
use App\Modules\Auth\Models\User;
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
        $perPage = 20;
        $currentPage = max(1, (int) ($_GET['page'] ?? 1));
        $totalJobs = $this->countJobs($keyword, $location);
        $totalPages = max(1, (int) ceil($totalJobs / $perPage));
        if ($currentPage > $totalPages) {
            $currentPage = $totalPages;
        }

        $jobs = $this->findJobs($keyword, $location, $currentPage, $perPage);
        if ($selectedId > 0) {
            $selectedJob = $this->findJobById($selectedId);
        } else {
            $selectedJob = $this->resolveSelectedJob($jobs, 0);
        }

        ob_start();
        require base_path('app/Views/home/index.php');
        $content = (string) ob_get_clean();
        require base_path('app/Views/layouts/main.php');
    }

    public function applyPage(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (empty($_SESSION['auth']['is_logged_in'])) {
            header('Location: /login');
            exit;
        }

        $jobId = (int) ($_GET['job'] ?? 0);
        $job = $this->findJobApplyById($jobId);
        if ($job === null) {
            header('Location: /');
            exit;
        }

        $applicant = $_SESSION['auth']['applicant'] ?? [];
        $userModel = new User();
        $resume = $userModel->getCurrentApplicantResume((int) ($applicant['applicant_account_id'] ?? 0));
        $recentlyApplied = $this->hasRecentApplication(
            (int) ($job['job_post_id'] ?? 0),
            (int) ($applicant['applicant_account_id'] ?? 0),
            (string) ($applicant['email'] ?? '')
        );

        $title = 'Apply';
        ob_start();
        require base_path('app/Views/home/apply.php');
        $content = (string) ob_get_clean();
        require base_path('app/Views/layouts/main.php');
    }

    public function applyAjax(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        header('Content-Type: application/json; charset=UTF-8');

        if (empty($_SESSION['auth']['is_logged_in'])) {
            http_response_code(401);
            echo json_encode(['ok' => false, 'message' => 'Not authenticated.']);
            return;
        }

        $jobId = (int) ($_POST['job_id'] ?? 0);
        $job = $this->findJobApplyById($jobId);
        if ($job === null) {
            http_response_code(404);
            echo json_encode(['ok' => false, 'message' => 'Job not found.']);
            return;
        }

        $applicant = $_SESSION['auth']['applicant'] ?? [];
        $applicantAccountId = (int) ($applicant['applicant_account_id'] ?? 0);
        $applicantEmail = (string) ($applicant['email'] ?? '');
        $alreadyApplied = $this->hasRecentApplication($jobId, $applicantAccountId, $applicantEmail);
        if ($alreadyApplied) {
            http_response_code(409);
            echo json_encode([
                'ok' => false,
                'message' => 'You already applied to this job. You can apply again after 3 months if the job is still active.',
            ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
            return;
        }

        $userModel = new User();
        $resume = $userModel->getCurrentApplicantResume($applicantAccountId);

        $db = Database::connect();
        $db->beginTransaction();
        try {
            $externalApplyId = 'apply_' . $applicantAccountId . '_' . $jobId . '_' . gmdate('YmdHis');
            $fullName = trim((string) (($applicant['first_name'] ?? '') . ' ' . ($applicant['last_name'] ?? '')));

            $insertPool = $db->prepare("
                INSERT INTO job_applicant_pool (
                    external_source_system, external_apply_id, job_post_id, office_id, account_id,
                    source_name, first_name, last_name, full_name, phone, email, has_resume,
                    resume_file_path, resume_original_filename, raw_payload_json, applicant_status, parse_status, score_status
                ) VALUES (
                    :external_source_system, :external_apply_id, :job_post_id, :office_id, :account_id,
                    :source_name, :first_name, :last_name, :full_name, :phone, :email, :has_resume,
                    :resume_file_path, :resume_original_filename, :raw_payload_json, 'new', 'not_started', 'not_started'
                )
            ");
            $insertPool->execute([
                'external_source_system' => 'jobpost_candidate_portal',
                'external_apply_id' => $externalApplyId,
                'job_post_id' => (int) $job['job_post_id'],
                'office_id' => isset($job['office_id']) ? (int) $job['office_id'] : null,
                'account_id' => isset($job['account_id']) ? (int) $job['account_id'] : null,
                'source_name' => 'jobpost',
                'first_name' => (string) ($applicant['first_name'] ?? ''),
                'last_name' => (string) ($applicant['last_name'] ?? ''),
                'full_name' => $fullName,
                'phone' => (string) ($applicant['phone'] ?? ''),
                'email' => (string) ($applicant['email'] ?? ''),
                'has_resume' => $resume ? 1 : 0,
                'resume_file_path' => $resume['file_path'] ?? null,
                'resume_original_filename' => $resume['original_file_name'] ?? null,
                'raw_payload_json' => json_encode([
                    'applicant_account_id' => $applicantAccountId,
                    'active_resume_id' => $resume['applicant_resume_id'] ?? null,
                    'submitted_via' => 'candidate_apply_page',
                ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES),
            ]);
            $poolId = (int) $db->lastInsertId();

            if ($resume) {
                $insertResume = $db->prepare("
                    INSERT INTO job_applicant_resumes (
                        applicant_pool_id, job_post_id, resume_source, file_path, original_filename, mime_type, size_bytes, is_active, parse_status
                    ) VALUES (
                        :applicant_pool_id, :job_post_id, :resume_source, :file_path, :original_filename, :mime_type, :size_bytes, 1, 'not_started'
                    )
                ");
                $insertResume->execute([
                    'applicant_pool_id' => $poolId,
                    'job_post_id' => (int) $job['job_post_id'],
                    'resume_source' => 'applicant_current_resume',
                    'file_path' => $resume['file_path'] ?? null,
                    'original_filename' => $resume['original_file_name'] ?? null,
                    'mime_type' => $resume['file_mime_type'] ?? null,
                    'size_bytes' => isset($resume['file_size_bytes']) ? (int) $resume['file_size_bytes'] : null,
                ]);
            }

            $db->commit();
            echo json_encode([
                'ok' => true,
                'message' => 'Application submitted.',
                'applicant_pool_id' => $poolId,
            ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
            return;
        } catch (\Throwable $e) {
            if ($db->inTransaction()) {
                $db->rollBack();
            }
            http_response_code(500);
            echo json_encode(['ok' => false, 'message' => 'Unable to submit application.']);
            return;
        }
    }

    /**
     * @return array<int, array<string, mixed>>
     */
    private function findJobs(string $keyword, string $location, int $page, int $perPage): array
    {
        $db = Database::connect();
        $offset = max(0, ($page - 1) * $perPage);

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
    DATE(jp.created_utc) = UTC_DATE() AS is_new_today,
    jb.job_board_id,
    TRIM(COALESCE(o.OfficeName, '')) AS office_name,
    NULLIF(TRIM(o.OfficeName), '') AS company_name
FROM job_posts jp
LEFT JOIN job_boards jb ON jb.job_board_id = jp.job_board_id
LEFT JOIN office o ON o.office_id = jp.office_id
WHERE jp.active = 1
  AND jp.created_utc >= DATE_SUB(UTC_TIMESTAMP(), INTERVAL 3 MONTH)
SQL;

        $params = [];

        if ($keyword !== '') {
            $sql .= ' AND (jp.job_title LIKE :keyword_title OR jp.description_text LIKE :keyword_description OR jb.job_board_name LIKE :keyword_company OR o.OfficeName LIKE :keyword_office)';
            $keywordLike = '%' . $keyword . '%';
            $params['keyword_title'] = $keywordLike;
            $params['keyword_description'] = $keywordLike;
            $params['keyword_company'] = $keywordLike;
            $params['keyword_office'] = $keywordLike;
        }

        if ($location !== '') {
            $sql .= ' AND (jp.job_location LIKE :location_full OR jp.city LIKE :location_city OR jp.state_code LIKE :location_state)';
            $locationLike = '%' . $location . '%';
            $params['location_full'] = $locationLike;
            $params['location_city'] = $locationLike;
            $params['location_state'] = $locationLike;
        }

        $sql .= ' ORDER BY jp.created_utc DESC, jp.job_post_id DESC LIMIT :limit OFFSET :offset';

        $stmt = $db->prepare($sql);
        foreach ($params as $key => $value) {
            $stmt->bindValue(':' . $key, $value, PDO::PARAM_STR);
        }
        $stmt->bindValue(':limit', $perPage, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    private function countJobs(string $keyword, string $location): int
    {
        $db = Database::connect();

        $sql = <<<'SQL'
SELECT COUNT(*)
FROM job_posts jp
LEFT JOIN job_boards jb ON jb.job_board_id = jp.job_board_id
LEFT JOIN office o ON o.office_id = jp.office_id
WHERE jp.active = 1
  AND jp.created_utc >= DATE_SUB(UTC_TIMESTAMP(), INTERVAL 3 MONTH)
SQL;

        $params = [];

        if ($keyword !== '') {
            $sql .= ' AND (jp.job_title LIKE :keyword_title OR jp.description_text LIKE :keyword_description OR jb.job_board_name LIKE :keyword_company OR o.OfficeName LIKE :keyword_office)';
            $keywordLike = '%' . $keyword . '%';
            $params['keyword_title'] = $keywordLike;
            $params['keyword_description'] = $keywordLike;
            $params['keyword_company'] = $keywordLike;
            $params['keyword_office'] = $keywordLike;
        }

        if ($location !== '') {
            $sql .= ' AND (jp.job_location LIKE :location_full OR jp.city LIKE :location_city OR jp.state_code LIKE :location_state)';
            $locationLike = '%' . $location . '%';
            $params['location_full'] = $locationLike;
            $params['location_city'] = $locationLike;
            $params['location_state'] = $locationLike;
        }

        $stmt = $db->prepare($sql);
        $stmt->execute($params);

        return (int) $stmt->fetchColumn();
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
    DATE(jp.created_utc) = UTC_DATE() AS is_new_today,
    jb.job_board_id,
    TRIM(COALESCE(o.OfficeName, '')) AS office_name,
    NULLIF(TRIM(o.OfficeName), '') AS company_name
FROM job_posts jp
LEFT JOIN job_boards jb ON jb.job_board_id = jp.job_board_id
LEFT JOIN office o ON o.office_id = jp.office_id
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
     * @return array<string, mixed>|null
     */
    private function findJobApplyById(int $jobId): ?array
    {
        if ($jobId <= 0) {
            return null;
        }
        $db = Database::connect();
        $sql = "
            SELECT
                jp.job_post_id,
                jp.account_id,
                jp.office_id,
                jp.job_title,
                jp.job_location,
                jp.city,
                jp.state_code,
                jb.job_board_id,
                TRIM(COALESCE(o.OfficeName, '')) AS office_name,
                NULLIF(TRIM(o.OfficeName), '') AS company_name
            FROM job_posts jp
            LEFT JOIN job_boards jb ON jb.job_board_id = jp.job_board_id
            LEFT JOIN office o ON o.office_id = jp.office_id
            WHERE jp.job_post_id = :job_post_id
              AND jp.active = 1
            LIMIT 1
        ";
        $stmt = $db->prepare($sql);
        $stmt->execute(['job_post_id' => $jobId]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row ?: null;
    }

    private function hasRecentApplication(int $jobId, int $applicantAccountId, string $applicantEmail): bool
    {
        if ($jobId <= 0) {
            return false;
        }

        $db = Database::connect();
        $sql = "
            SELECT jap.applicant_pool_id
            FROM job_applicant_pool jap
            WHERE jap.job_post_id = :job_post_id
              AND jap.removed = 0
              AND jap.created_utc >= DATE_SUB(UTC_TIMESTAMP(), INTERVAL 3 MONTH)
              AND (
                    JSON_UNQUOTE(JSON_EXTRACT(jap.raw_payload_json, '$.applicant_account_id')) = :applicant_account_id
                 OR (:applicant_email_check <> '' AND LOWER(jap.email) = LOWER(:applicant_email_match))
              )
            LIMIT 1
        ";
        $stmt = $db->prepare($sql);
        $stmt->execute([
            'job_post_id' => $jobId,
            'applicant_account_id' => (string) $applicantAccountId,
            'applicant_email_check' => trim($applicantEmail),
            'applicant_email_match' => trim($applicantEmail),
        ]);
        return (bool) $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
