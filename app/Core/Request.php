<?php

namespace App\Core;

class Request
{
    public function method(): string
    {
        return strtoupper($_SERVER['REQUEST_METHOD'] ?? 'GET');
    }

    public function uri(): string
    {
        $uri = $_SERVER['REQUEST_URI'] ?? '/';

        $path = parse_url($uri, PHP_URL_PATH);

        if (!$path) {
            return '/';
        }

        return rtrim($path, '/') ?: '/';
    }

    public function path(): string
    {
        $path = $this->uri();

        if (str_starts_with($path, '/public')) {
            $path = substr($path, 7);
            $path = $path ?: '/';
        }

        return $path;
    }

    public function input(?string $key = null, mixed $default = null): mixed
    {
        $data = array_merge($_GET, $_POST);

        if ($key === null) {
            return $data;
        }

        return $data[$key] ?? $default;
    }

    public function query(?string $key = null, mixed $default = null): mixed
    {
        if ($key === null) {
            return $_GET;
        }

        return $_GET[$key] ?? $default;
    }

    public function post(?string $key = null, mixed $default = null): mixed
    {
        if ($key === null) {
            return $_POST;
        }

        return $_POST[$key] ?? $default;
    }

    public function isGet(): bool
    {
        return $this->method() === 'GET';
    }

    public function isPost(): bool
    {
        return $this->method() === 'POST';
    }

    public function server(?string $key = null, mixed $default = null): mixed
    {
        if ($key === null) {
            return $_SERVER;
        }

        return $_SERVER[$key] ?? $default;
    }
}