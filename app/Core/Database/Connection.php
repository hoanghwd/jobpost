<?php

namespace App\Core\Database;

use PDO;
use PDOException;

class Connection
{
    protected static ?PDO $pdo = null;

    public static function get(): PDO
    {
        if (self::$pdo !== null) {
            return self::$pdo;
        }

        $host = env('DB_HOST');
        $port = env('DB_PORT');
        $db   = env('DB_DATABASE');
        $user = env('DB_USERNAME');
        $pass = env('DB_PASSWORD');

        $dsn = "mysql:host={$host};port={$port};dbname={$db};charset=utf8mb4";

        try {

            self::$pdo = new PDO(
                $dsn,
                $user,
                $pass,
                [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_EMULATE_PREPARES => false
                ]
            );

        }
        catch (PDOException $e) {

            die('Database connection failed: ' . $e->getMessage());

        }

        return self::$pdo;
    }
}