<?php
declare(strict_types=1);

namespace App\Modules\Auth\Models;

use App\Core\Model;
use PDO;

class User extends Model
{
    protected string $table = 'applicant_accounts';
    protected string $primaryKey = 'applicant_account_id';

    public function findForLogin(string $login): ?array
    {
        $sql = "
            SELECT
                aa.applicant_account_id,
                aa.first_name,
                aa.last_name,
                aa.email,
                aa.username,
                aa.phone,
                aa.password_hash,
                aa.status,
                aa.email_verified,
                aa.phone_verified,
                aa.last_login_utc
            FROM applicant_accounts aa
            WHERE aa.username = :login
               OR aa.email = :login_email
            LIMIT 1
        ";

        $login = trim($login);
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':login', $login, PDO::PARAM_STR);
        $stmt->bindValue(':login_email', $login, PDO::PARAM_STR);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row ?: null;
    }

    public function touchApplicantLastLogin(int $applicantAccountId): void
    {
        if ($applicantAccountId <= 0) {
            return;
        }

        $sql = "
            UPDATE applicant_accounts
            SET last_login_utc = UTC_TIMESTAMP()
            WHERE applicant_account_id = :applicant_account_id
            LIMIT 1
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':applicant_account_id', $applicantAccountId, PDO::PARAM_INT);
        $stmt->execute();
    }

    public function getApplicantProfile(int $applicantAccountId): ?array
    {
        if ($applicantAccountId <= 0) {
            return null;
        }

        $sql = "
            SELECT
                applicant_account_id,
                first_name,
                last_name,
                email,
                phone,
                username,
                profile_summary_html,
                work_experience_json,
                education_json
            FROM applicant_accounts
            WHERE applicant_account_id = :applicant_account_id
            LIMIT 1
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':applicant_account_id', $applicantAccountId, PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        $row['work_experience_json'] = $this->sortWorkExperience($this->decodeList((string) ($row['work_experience_json'] ?? '')));
        $row['education_json'] = $this->decodeList((string) ($row['education_json'] ?? ''));

        return $row;
    }

    public function saveProfileSummary(int $applicantAccountId, ?string $summaryHtml): void
    {
        $sql = "
            UPDATE applicant_accounts
            SET profile_summary_html = :summary_html
            WHERE applicant_account_id = :applicant_account_id
            LIMIT 1
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':summary_html', $summaryHtml, $summaryHtml === null ? PDO::PARAM_NULL : PDO::PARAM_STR);
        $stmt->bindValue(':applicant_account_id', $applicantAccountId, PDO::PARAM_INT);
        $stmt->execute();
    }

    /**
     * @return array<int, array<string, mixed>>
     */
    public function getApplicantResumes(int $applicantAccountId): array
    {
        if ($applicantAccountId <= 0) {
            return [];
        }

        $sql = "
            SELECT
                applicant_resume_id,
                resume_label,
                original_file_name,
                file_path,
                file_mime_type,
                file_size_bytes,
                created_utc,
                updated_utc
            FROM applicant_resumes
            WHERE applicant_account_id = :applicant_account_id
              AND deleted_utc IS NULL
            ORDER BY created_utc DESC, applicant_resume_id DESC
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':applicant_account_id', $applicantAccountId, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function softDeleteApplicantResume(int $applicantAccountId, int $resumeId): void
    {
        if ($applicantAccountId <= 0 || $resumeId <= 0) {
            return;
        }

        $sql = "
            UPDATE applicant_resumes
            SET deleted_utc = UTC_TIMESTAMP()
            WHERE applicant_resume_id = :resume_id
              AND applicant_account_id = :applicant_account_id
              AND deleted_utc IS NULL
            LIMIT 1
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':resume_id', $resumeId, PDO::PARAM_INT);
        $stmt->bindValue(':applicant_account_id', $applicantAccountId, PDO::PARAM_INT);
        $stmt->execute();
    }

    public function upsertProfileListItem(int $applicantAccountId, string $column, array $item): void
    {
        if (!in_array($column, ['work_experience_json', 'education_json'], true)) {
            return;
        }

        $profile = $this->getApplicantProfile($applicantAccountId);
        if (!$profile) {
            return;
        }

        $items = $profile[$column] ?? [];
        if (!is_array($items)) {
            $items = [];
        }

        $itemId = trim((string) ($item['item_id'] ?? ''));
        if ($itemId === '') {
            $itemId = bin2hex(random_bytes(8));
            $item['item_id'] = $itemId;
        }

        $updated = false;
        foreach ($items as $idx => $existing) {
            if (($existing['item_id'] ?? '') === $itemId) {
                $items[$idx] = $item;
                $updated = true;
                break;
            }
        }

        if (!$updated) {
            array_unshift($items, $item);
        }

        $json = json_encode(array_values($items), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        $sql = "UPDATE applicant_accounts SET {$column} = :payload WHERE applicant_account_id = :applicant_account_id LIMIT 1";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':payload', $json ?: '[]', PDO::PARAM_STR);
        $stmt->bindValue(':applicant_account_id', $applicantAccountId, PDO::PARAM_INT);
        $stmt->execute();
    }

    public function deleteProfileListItem(int $applicantAccountId, string $column, string $itemId): void
    {
        if (!in_array($column, ['work_experience_json', 'education_json'], true) || trim($itemId) === '') {
            return;
        }

        $profile = $this->getApplicantProfile($applicantAccountId);
        if (!$profile) {
            return;
        }

        $items = $profile[$column] ?? [];
        if (!is_array($items)) {
            $items = [];
        }

        $items = array_values(array_filter($items, static fn (array $row): bool => (string) ($row['item_id'] ?? '') !== $itemId));

        $json = json_encode($items, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        $sql = "UPDATE applicant_accounts SET {$column} = :payload WHERE applicant_account_id = :applicant_account_id LIMIT 1";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':payload', $json ?: '[]', PDO::PARAM_STR);
        $stmt->bindValue(':applicant_account_id', $applicantAccountId, PDO::PARAM_INT);
        $stmt->execute();
    }

    private function decodeList(string $json): array
    {
        $json = trim($json);
        if ($json === '') {
            return [];
        }

        try {
            $decoded = json_decode($json, true, 512, JSON_THROW_ON_ERROR);
            return is_array($decoded) ? $decoded : [];
        } catch (\Throwable $e) {
            return [];
        }
    }

    /**
     * @param array<int, array<string, mixed>> $items
     * @return array<int, array<string, mixed>>
     */
    private function sortWorkExperience(array $items): array
    {
        $normalized = [];
        foreach ($items as $item) {
            $item = is_array($item) ? $item : [];
            $parts = $this->extractDateParts($item);
            $item['start_month'] = $parts['start_month'];
            $item['start_year'] = $parts['start_year'];
            $item['end_month'] = $parts['end_month'];
            $item['end_year'] = $parts['end_year'];
            $item['is_current'] = $parts['is_current'];
            $normalized[] = $item;
        }

        usort($normalized, function (array $a, array $b): int {
            $aCurrent = (int) ($a['is_current'] ?? 0);
            $bCurrent = (int) ($b['is_current'] ?? 0);
            if ($aCurrent !== $bCurrent) {
                return $bCurrent <=> $aCurrent;
            }

            $aEndYear = (int) ($a['end_year'] ?? 0);
            $bEndYear = (int) ($b['end_year'] ?? 0);
            if ($aEndYear !== $bEndYear) {
                return $bEndYear <=> $aEndYear;
            }

            $aEndMonth = $this->monthToNum((string) ($a['end_month'] ?? ''));
            $bEndMonth = $this->monthToNum((string) ($b['end_month'] ?? ''));
            if ($aEndMonth !== $bEndMonth) {
                return $bEndMonth <=> $aEndMonth;
            }

            $aStartYear = (int) ($a['start_year'] ?? 0);
            $bStartYear = (int) ($b['start_year'] ?? 0);
            if ($aStartYear !== $bStartYear) {
                return $bStartYear <=> $aStartYear;
            }

            $aStartMonth = $this->monthToNum((string) ($a['start_month'] ?? ''));
            $bStartMonth = $this->monthToNum((string) ($b['start_month'] ?? ''));
            return $bStartMonth <=> $aStartMonth;
        });

        return $normalized;
    }

    /**
     * @param array<string, mixed> $item
     * @return array{start_month:string,start_year:string,end_month:string,end_year:string,is_current:int}
     */
    private function extractDateParts(array $item): array
    {
        $startMonth = trim((string) ($item['start_month'] ?? ''));
        $startYear = trim((string) ($item['start_year'] ?? ''));
        $endMonth = trim((string) ($item['end_month'] ?? ''));
        $endYear = trim((string) ($item['end_year'] ?? ''));
        $isCurrent = (int) ($item['is_current'] ?? 0) === 1 ? 1 : 0;

        if ($startMonth !== '' || $startYear !== '' || $endMonth !== '' || $endYear !== '' || $isCurrent === 1) {
            return [
                'start_month' => $startMonth,
                'start_year' => $startYear,
                'end_month' => $endMonth,
                'end_year' => $endYear,
                'is_current' => $isCurrent,
            ];
        }

        $dateRange = trim((string) ($item['date_range'] ?? ''));
        if ($dateRange === '') {
            return [
                'start_month' => '',
                'start_year' => '',
                'end_month' => '',
                'end_year' => '',
                'is_current' => 0,
            ];
        }

        $parts = preg_split('/\s+to\s+/i', $dateRange) ?: [];
        $startRaw = trim((string) ($parts[0] ?? ''));
        $endRaw = trim((string) ($parts[1] ?? ''));
        $isCurrent = preg_match('/present/i', $endRaw) ? 1 : 0;

        [$startMonth, $startYear] = $this->parseDateToken($startRaw);
        [$endMonth, $endYear] = $isCurrent === 1 ? ['', ''] : $this->parseDateToken($endRaw);

        return [
            'start_month' => $startMonth,
            'start_year' => $startYear,
            'end_month' => $endMonth,
            'end_year' => $endYear,
            'is_current' => $isCurrent,
        ];
    }

    /**
     * @return array{0:string,1:string}
     */
    private function parseDateToken(string $value): array
    {
        $value = trim($value);
        if ($value === '') {
            return ['', ''];
        }

        $tokens = preg_split('/\s+/', $value) ?: [];
        $month = '';
        $year = '';
        foreach ($tokens as $token) {
            $token = trim((string) $token);
            if ($month === '' && $this->monthToNum($token) > 0) {
                $month = $token;
            }
            if ($year === '' && preg_match('/^\d{4}$/', $token)) {
                $year = $token;
            }
        }

        return [$month, $year];
    }

    private function monthToNum(string $month): int
    {
        static $map = [
            'january' => 1,
            'february' => 2,
            'march' => 3,
            'april' => 4,
            'may' => 5,
            'june' => 6,
            'july' => 7,
            'august' => 8,
            'september' => 9,
            'october' => 10,
            'november' => 11,
            'december' => 12,
        ];
        return $map[strtolower(trim($month))] ?? 0;
    }
}
