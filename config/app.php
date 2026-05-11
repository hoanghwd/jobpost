<?php

return [
    'name' => env('APP_NAME', 'jobportal'),
    'url' => env('APP_URL', 'http://localhost'),
    'env' => env('APP_ENV', 'production'),
    'debug' => filter_var(env('APP_DEBUG', false), FILTER_VALIDATE_BOOLEAN),
    'timezone' => env('APP_TIMEZONE', 'America/Los_Angeles'),
];