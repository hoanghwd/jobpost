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
}
