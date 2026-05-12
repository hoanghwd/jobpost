<?php
declare(strict_types=1);

use App\Modules\Home\Controllers\HomeController;
use App\Modules\Auth\Controllers\AuthController;
/** @var \App\Core\Router $router */

$router->get('/', [HomeController::class, 'index']);
$router->get('/dashboard', [HomeController::class, 'index']);
$router->get('/apply', [HomeController::class, 'applyPage']);
$router->post('/apply-ajax', [HomeController::class, 'applyAjax']);

$router->get('/login', [AuthController::class, 'showLogin']);
$router->get('/profile', [AuthController::class, 'showProfile']);
$router->get('/resume-file', [AuthController::class, 'serveResumeFile']);
$router->post('/login-ajax', [AuthController::class, 'loginAjax']);
$router->post('/logout-ajax', [AuthController::class, 'logoutAjax']);
$router->post('/profile-content-ajax', [AuthController::class, 'profileContentAjax']);
$router->post('/profile-resume-ajax', [AuthController::class, 'profileResumeAjax']);
