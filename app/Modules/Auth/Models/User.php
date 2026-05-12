<?php
declare(strict_types=1);

namespace App\Modules\Auth\Models;

use App\Core\Model;
use PDO;

class User extends Model
{
    protected string $table = 'users';
    protected string $primaryKey = 'user_id';

    public function findForLogin(string $login): ?array
    {
        $sql = "
            SELECT
                u.user_id,
                u.first_name,
                u.last_name,
                u.email,
                u.username,
                u.password,
                u.active AS user_active,
                u.account_fk,
                u.phone,
                a.account_id,
                a.officeFK,
                a.accName,
                a.officeName,
                a.ownerName,
                a.active AS account_active,
                a.timezoneSqlName
            FROM users u
            LEFT JOIN accounts a
                ON a.account_id = u.account_fk
            WHERE u.username = :login
               OR u.email = :login_email
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

    public function getOfficeAccounts(?string $officeFk, ?int $fallbackAccountId = null): array
    {
        $officeFk = trim((string)($officeFk ?? ''));
        if ($officeFk !== '') {
            $sql = "
                SELECT
                    a.account_id,
                    a.officeFK,
                    a.officeName,
                    a.accName,
                    COALESCE(
                        NULLIF(TRIM(a.accName), ''),
                        NULLIF(TRIM(a.officeName), ''),
                        CONCAT('Account #', a.account_id)
                    ) AS account_label
                FROM accounts a
                WHERE a.officeFK = :office_fk
                ORDER BY account_label ASC, a.account_id ASC
            ";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':office_fk', $officeFk, PDO::PARAM_STR);
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
            if (!empty($rows)) {
                return array_map([$this, 'normalizeAccountRow'], $rows);
            }
        }

        if ($fallbackAccountId !== null && $fallbackAccountId > 0) {
            $sql = "
                SELECT
                    a.account_id,
                    a.officeFK,
                    a.officeName,
                    a.accName,
                    COALESCE(
                        NULLIF(TRIM(a.accName), ''),
                        NULLIF(TRIM(a.officeName), ''),
                        CONCAT('Account #', a.account_id)
                    ) AS account_label
                FROM accounts a
                WHERE a.account_id = :account_id
                LIMIT 1
            ";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':account_id', $fallbackAccountId, PDO::PARAM_INT);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                return [$this->normalizeAccountRow($row)];
            }
        }

        return [];
    }

    protected function normalizeAccountRow(array $row): array
    {
        return [
            'account_id' => isset($row['account_id']) ? (int)$row['account_id'] : 0,
            'officeFK' => isset($row['officeFK']) ? trim((string)$row['officeFK']) : '',
            'officeName' => $row['officeName'] ?? null,
            'accName' => $row['accName'] ?? null,
            'account_label' => trim((string)($row['account_label'] ?? '')) !== ''
                ? trim((string)$row['account_label'])
                : 'Account #' . (int)($row['account_id'] ?? 0),
        ];
    }
}
