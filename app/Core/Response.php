<?php

namespace App\Core;

class Response
{
    public function setStatusCode(int $code): self
    {
        http_response_code($code);

        return $this;
    }

    public function header(string $name, string $value): self
    {
        header($name . ': ' . $value);

        return $this;
    }

    public function html(string $content, int $statusCode = 200): void
    {
        $this->setStatusCode($statusCode);
        $this->header('Content-Type', 'text/html; charset=UTF-8');

        echo $content;
    }

    public function json(array $data, int $statusCode = 200): void
    {
        $this->setStatusCode($statusCode);
        $this->header('Content-Type', 'application/json; charset=UTF-8');

        echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    }

    public function redirect(string $url, int $statusCode = 302): void
    {
        $this->setStatusCode($statusCode);
        header('Location: ' . $url);
        exit;
    }

    public function back(int $statusCode = 302): void
    {
        $referer = $_SERVER['HTTP_REFERER'] ?? '/';

        $this->redirect($referer, $statusCode);
    }
}