<?php

if (!defined('PROJECT_ROOT')) {
    define('PROJECT_ROOT', dirname(__DIR__));
}

if (!defined('APP_ROOT')) {
    define('APP_ROOT', PROJECT_ROOT . '/app');
}

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

use App\Core\Application;
use App\Core\Config;
use App\Core\Env;

require_once dirname(__DIR__) . '/vendor/autoload.php';
require_once dirname(__DIR__) . '/app/helpers.php';

Env::load(dirname(__DIR__) . '/.env');
Config::load(dirname(__DIR__) . '/config');

$app = new Application();
$app->bootstrap();

return $app;
