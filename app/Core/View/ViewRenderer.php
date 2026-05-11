<?php

namespace App\Core\View;

class ViewRenderer
{
    public function render(string $view, array $data = [], ?string $layout = 'layouts.main'): string
    {
        $viewPath = $this->resolveViewPath($view);
        $content = $this->renderFile($viewPath, $data);

        if ($layout === null) {
            return $content;
        }

        $layoutPath = $this->resolveViewPath($layout);

        $layoutData = array_merge($data, [
            'content' => $content,
        ]);

        return $this->renderFile($layoutPath, $layoutData);
    }

    protected function renderFile(string $filePath, array $data = []): string
    {
        if (!file_exists($filePath)) {
            throw new \RuntimeException("View file not found: {$filePath}");
        }

        extract($data, EXTR_SKIP);

        ob_start();
        require $filePath;
        return (string) ob_get_clean();
    }

    protected function resolveViewPath(string $view): string
    {
        $view = str_replace('.', '/', $view);

        return base_path('app/Views/' . $view . '.php');
    }
}