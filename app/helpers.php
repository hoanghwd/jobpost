<?php

use App\Core\Config;
use App\Core\Env;

if (!function_exists('env')) {
    function env(string $key, mixed $default = null): mixed
    {
        return Env::get($key, $default);
    }
}

if (!function_exists('config')) {
    function config(string $key, mixed $default = null): mixed
    {
        return Config::get($key, $default);
    }
}

if (!function_exists('base_path')) {
    function base_path(string $path = ''): string
    {
        $base = dirname(__DIR__);

        return $path ? $base . '/' . ltrim($path, '/') : $base;
    }
}

if (!function_exists('app_path')) {
    function app_path(string $path = ''): string
    {
        $base = base_path('app');

        return $path ? $base . '/' . ltrim($path, '/') : $base;
    }
}

if (!function_exists('config_path')) {
    function config_path(string $path = ''): string
    {
        $base = base_path('config');

        return $path ? $base . '/' . ltrim($path, '/') : $base;
    }
}

if (!function_exists('storage_path')) {
    function storage_path(string $path = ''): string
    {
        $base = base_path('storage');

        return $path ? $base . '/' . ltrim($path, '/') : $base;
    }
}

if (!function_exists('public_path')) {
    function public_path(string $path = ''): string
    {
        $base = base_path('public');

        return $path ? $base . '/' . ltrim($path, '/') : $base;
    }
}