<?php

namespace App\Core;

use App\Core\View\ViewRenderer;

class Controller
{
    protected function view(string $view, array $data = [], string $layout = 'layouts.main'): void
    {
        $renderer = new ViewRenderer();

        echo $renderer->render($view, $data, $layout);
    }

    protected function json(array $data, int $statusCode = 200): void
    {
        $response = new Response();
        $response->json($data, $statusCode);
    }

    protected function redirect(string $url, int $statusCode = 302): void
    {
        $response = new Response();
        $response->redirect($url, $statusCode);
    }
}