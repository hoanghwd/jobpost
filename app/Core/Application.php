<?php

namespace App\Core;

class Application
{
    protected Request $request;
    protected Response $response;
    protected Router $router;

    public function bootstrap(): void
    {
        $this->setTimezone();
        $this->startSession();
        $this->initializeCore();
    }

    public function run(): void
    {
        $this->loadRoutes();
        $this->router->dispatch();
    }

    protected function setTimezone(): void
    {
        $timezone = config('app.timezone', 'America/Los_Angeles');

        date_default_timezone_set($timezone);
    }

    protected function startSession(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            $sessionPath = storage_path('sessions');
            $usableSessionPath = null;

            if (is_dir($sessionPath) || @mkdir($sessionPath, 0775, true)) {
                if (is_writable($sessionPath)) {
                    $usableSessionPath = $sessionPath;
                }
            }

            if ($usableSessionPath === null) {
                $fallbackPath = rtrim(sys_get_temp_dir(), DIRECTORY_SEPARATOR) . DIRECTORY_SEPARATOR . 'jobpost_sessions';

                if (is_dir($fallbackPath) || @mkdir($fallbackPath, 0775, true)) {
                    if (is_writable($fallbackPath)) {
                        $usableSessionPath = $fallbackPath;
                    }
                }
            }

            if ($usableSessionPath !== null) {
                session_save_path($usableSessionPath);
            }

            @session_start();
        }
    }

    protected function initializeCore(): void
    {
        $this->request = new Request();
        $this->response = new Response();
        $this->router = new Router($this->request, $this->response);
    }

    protected function loadRoutes(): void
    {
        $router = $this->router;

        require base_path('routes/web.php');
    }

    public function request(): Request
    {
        return $this->request;
    }

    public function response(): Response
    {
        return $this->response;
    }

    public function router(): Router
    {
        return $this->router;
    }
}
