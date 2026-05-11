<?php

namespace App\Core;

class Config
{
    protected static array $items = [];

    public static function load(string $configPath): void
    {
        $files = glob(rtrim($configPath, '/') . '/*.php');

        if (!$files) {
            return;
        }

        foreach ($files as $file) {
            $key = basename($file, '.php');

            self::$items[$key] = require $file;
        }
    }

    public static function get(string $key, mixed $default = null): mixed
    {
        $segments = explode('.', $key);

        $value = self::$items;

        foreach ($segments as $segment) {
            if (!is_array($value) || !array_key_exists($segment, $value)) {
                return $default;
            }

            $value = $value[$segment];
        }

        return $value;
    }

    public static function all(): array
    {
        return self::$items;
    }
}