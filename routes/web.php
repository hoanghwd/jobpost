<?php
declare(strict_types=1);

use App\Modules\Home\Controllers\HomeController;
/** @var \App\Core\Router $router */

$router->get('/', [HomeController::class, 'index']);
