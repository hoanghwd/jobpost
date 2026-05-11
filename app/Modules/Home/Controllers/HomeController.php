<?php

declare(strict_types=1);

namespace App\Modules\Home\Controllers;

class HomeController
{
    public function index(): void
    {
        $title = 'Index';

        ob_start();
        require base_path('app/Views/home/index.php');
        $content = (string) ob_get_clean();
        require base_path('app/Views/layouts/main.php');
    }
}
