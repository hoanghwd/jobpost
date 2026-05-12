<?php
declare(strict_types=1);

namespace App\Modules\Auth\Controllers;

use App\Modules\Auth\Models\User;

class AuthController
{
    public function showLogin(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (!empty($_SESSION['auth']['is_logged_in'])) {
            header('Location: /dashboard');
            exit;
        }

        $title = 'Sign In';
        ob_start();
        require base_path('app/Views/auth/login.php');
        $content = (string) ob_get_clean();
        require base_path('app/Views/layouts/main.php');
    }

    public function showProfile(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (empty($_SESSION['auth']['is_logged_in'])) {
            header('Location: /login');
            exit;
        }

        $userModel = new User();
        $applicantAccountId = (int) ($_SESSION['auth']['applicant']['applicant_account_id'] ?? 0);
        $profile = $userModel->getApplicantProfile($applicantAccountId);
        $resumes = $userModel->getApplicantResumes($applicantAccountId);
        if ($profile === null) {
            header('Location: /login');
            exit;
        }

        $title = 'Candidate Profile';
        ob_start();
        require base_path('app/Views/auth/profile.php');
        $content = (string) ob_get_clean();
        require base_path('app/Views/layouts/main.php');
    }

    public function profileResumeAjax(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        header('Content-Type: application/json; charset=UTF-8');

        if (empty($_SESSION['auth']['is_logged_in'])) {
            $this->jsonFail('Not authenticated.', 401);
        }

        $applicantAccountId = (int) ($_SESSION['auth']['applicant']['applicant_account_id'] ?? 0);
        if ($applicantAccountId <= 0) {
            $this->jsonFail('Invalid account.', 422);
        }

        $action = trim((string) ($_POST['action'] ?? ''));
        $resumeId = (int) ($_POST['resume_id'] ?? 0);
        $userModel = new User();

        if ($action === 'delete') {
            $userModel->softDeleteApplicantResume($applicantAccountId, $resumeId);
        } else {
            $this->jsonFail('Unsupported action.', 422);
        }

        echo json_encode([
            'ok' => true,
            'message' => 'Resume updated.',
            'resumes' => $userModel->getApplicantResumes($applicantAccountId),
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        exit;
    }

    public function profileContentAjax(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        header('Content-Type: application/json; charset=UTF-8');

        if (empty($_SESSION['auth']['is_logged_in'])) {
            $this->jsonFail('Not authenticated.', 401);
        }

        $applicantAccountId = (int) ($_SESSION['auth']['applicant']['applicant_account_id'] ?? 0);
        if ($applicantAccountId <= 0) {
            $this->jsonFail('Invalid account.', 422);
        }

        $section = trim((string) ($_POST['section'] ?? ''));
        $action = trim((string) ($_POST['action'] ?? ''));
        $userModel = new User();

        if ($section === 'summary') {
            if ($action === 'save') {
                $summaryHtml = $this->sanitizeHtml((string) ($_POST['summary_html'] ?? ''));
                $userModel->saveProfileSummary($applicantAccountId, $summaryHtml === '' ? null : $summaryHtml);
            } elseif ($action === 'remove') {
                $userModel->saveProfileSummary($applicantAccountId, null);
            } else {
                $this->jsonFail('Unsupported action.', 422);
            }
        } elseif (in_array($section, ['work_experience', 'education'], true)) {
            $column = $section === 'work_experience' ? 'work_experience_json' : 'education_json';
            if ($action === 'save') {
                $item = [
                    'item_id' => trim((string) ($_POST['item_id'] ?? '')),
                    'title' => trim((string) ($_POST['title'] ?? '')),
                    'organization' => trim((string) ($_POST['organization'] ?? '')),
                    'location' => trim((string) ($_POST['location'] ?? '')),
                    'date_range' => trim((string) ($_POST['date_range'] ?? '')),
                    'start_month' => trim((string) ($_POST['start_month'] ?? '')),
                    'start_year' => trim((string) ($_POST['start_year'] ?? '')),
                    'end_month' => trim((string) ($_POST['end_month'] ?? '')),
                    'end_year' => trim((string) ($_POST['end_year'] ?? '')),
                    'is_current' => (int) ($_POST['is_current'] ?? 0) === 1 ? 1 : 0,
                    'description_html' => $this->sanitizeHtml((string) ($_POST['description_html'] ?? '')),
                ];
                if ($item['title'] === '' || $item['organization'] === '') {
                    $this->jsonFail('Title and organization are required.', 422);
                }
                $userModel->upsertProfileListItem($applicantAccountId, $column, $item);
            } elseif ($action === 'remove') {
                $itemId = trim((string) ($_POST['item_id'] ?? ''));
                if ($itemId === '') {
                    $this->jsonFail('Missing item id.', 422);
                }
                $userModel->deleteProfileListItem($applicantAccountId, $column, $itemId);
            } else {
                $this->jsonFail('Unsupported action.', 422);
            }
        } else {
            $this->jsonFail('Unsupported section.', 422);
        }

        $profile = $userModel->getApplicantProfile($applicantAccountId);
        echo json_encode([
            'ok' => true,
            'message' => 'Profile updated.',
            'profile' => $profile,
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        exit;
    }

    public function loginAjax(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        header('Content-Type: application/json; charset=UTF-8');

        $login = trim((string)($_POST['login'] ?? ''));
        $password = (string)($_POST['password'] ?? '');

        if ($login === '' || $password === '') {
            $this->jsonFail('Username/email and password are required.', 422);
        }

        $userModel = new User();
        $row = $userModel->findForLogin($login);

        if (!$row) {
            $this->jsonFail('User not found.', 401);
        }

        $status = strtolower(trim((string)($row['status'] ?? '')));
        if ($status === '' || in_array($status, ['inactive', 'disabled', 'blocked', 'locked', 'deleted'], true)) {
            $this->jsonFail('Account is not active.', 403);
        }

        $storedPassword = (string)($row['password_hash'] ?? '');
        $validPassword = false;

        if ($storedPassword !== '') {
            $passwordInfo = password_get_info($storedPassword);

            if (!empty($passwordInfo['algo'])) {
                $validPassword = password_verify($password, $storedPassword);
            } elseif (strlen($storedPassword) === 32 && ctype_xdigit($storedPassword)) {
                $validPassword = hash_equals(strtolower($storedPassword), md5($password));
            } elseif (strlen($storedPassword) === 40 && ctype_xdigit($storedPassword)) {
                $validPassword = hash_equals(strtolower($storedPassword), sha1($password));
            } else {
                $validPassword = hash_equals($storedPassword, $password);
            }
        }

        if (!$validPassword) {
            $this->jsonFail('Password mismatch.', 401);
        }

        $applicantAccountId = isset($row['applicant_account_id']) ? (int)$row['applicant_account_id'] : 0;
        if ($applicantAccountId > 0) {
            $userModel->touchApplicantLastLogin($applicantAccountId);
        }

        session_regenerate_id(true);

        $_SESSION['auth'] = [
            'is_logged_in' => true,
            'logged_in_at' => date('Y-m-d H:i:s'),
            'last_activity_utc' => gmdate('Y-m-d H:i:s'),
            'applicant' => [
                'applicant_account_id' => $applicantAccountId > 0 ? $applicantAccountId : null,
                'first_name' => $row['first_name'] ?? null,
                'last_name' => $row['last_name'] ?? null,
                'full_name' => trim(((string)($row['first_name'] ?? '')) . ' ' . ((string)($row['last_name'] ?? ''))),
                'email' => $row['email'] ?? null,
                'username' => $row['username'] ?? null,
                'phone' => $row['phone'] ?? null,
                'status' => $row['status'] ?? null,
                'email_verified' => isset($row['email_verified']) ? (int)$row['email_verified'] : 0,
                'phone_verified' => isset($row['phone_verified']) ? (int)$row['phone_verified'] : 0,
            ],
        ];

        echo json_encode([
            'ok' => true,
            'message' => 'Login successful.',
            'redirect' => '/dashboard',
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        exit;
    }

    public function logoutAjax(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        header('Content-Type: application/json; charset=UTF-8');

        $_SESSION = [];

        if (ini_get('session.use_cookies')) {
            $params = session_get_cookie_params();
            setcookie(
                session_name(),
                '',
                time() - 42000,
                $params['path'] ?? '/',
                $params['domain'] ?? '',
                (bool)($params['secure'] ?? false),
                (bool)($params['httponly'] ?? true)
            );
        }

        session_destroy();

        echo json_encode([
            'ok' => true,
            'message' => 'Logged out successfully.',
            'redirect' => '/',
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        exit;
    }

    public function ping(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        header('Content-Type: application/json; charset=UTF-8');

        if (empty($_SESSION['auth']['is_logged_in'])) {
            http_response_code(401);
            echo json_encode([
                'ok' => false,
                'session_expired' => true,
                'message' => 'Session expired.',
            ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
            exit;
        }

        $_SESSION['auth']['last_activity_utc'] = gmdate('Y-m-d H:i:s');

        echo json_encode([
            'ok' => true,
            'message' => 'Session refreshed.',
            'last_activity_utc' => $_SESSION['auth']['last_activity_utc'],
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        exit;
    }

    private function jsonFail(string $message, int $status = 400): void
    {
        http_response_code($status);
        echo json_encode([
            'ok' => false,
            'message' => $message,
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        exit;
    }

    private function sanitizeHtml(string $html): string
    {
        $clean = preg_replace('/<script\b[^>]*>(.*?)<\/script>/is', '', $html) ?? '';
        $clean = preg_replace('/\son\w+="[^"]*"/i', '', $clean) ?? '';
        $clean = preg_replace("/\son\w+='[^']*'/i", '', $clean) ?? '';
        return trim($clean);
    }
}
