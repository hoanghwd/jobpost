<?php

namespace App\Core;

use Closure;

class Router
{
    protected array $routes = [];
    protected Request $request;
    protected Response $response;

    public function __construct(Request $request, Response $response)
    {
        $this->request = $request;
        $this->response = $response;
    }

    public function get(string $path, Closure|array $handler): void
    {
        $this->addRoute('GET', $path, $handler);
    }

    public function post(string $path, Closure|array $handler): void
    {
        $this->addRoute('POST', $path, $handler);
    }

    protected function addRoute(string $method, string $path, Closure|array $handler): void
    {
        $path = $this->normalizePath($path);

        $this->routes[$method][$path] = $handler;
    }

    protected function normalizePath(string $path): string
    {
        $path = '/' . trim($path, '/');

        return $path === '//' ? '/' : $path;
    }

    protected function resolveRoute(string $method, string $path): array
    {
        $routes = $this->routes[$method] ?? [];

        if (isset($routes[$path])) {
            return [$routes[$path], []];
        }

        foreach ($routes as $routePath => $handler) {
            if (!str_contains($routePath, '{')) {
                continue;
            }

            $paramNames = [];
            $pattern = $this->routePattern($routePath, $paramNames);

            if (!preg_match($pattern, $path, $matches)) {
                continue;
            }

            array_shift($matches);
            $params = [];
            foreach ($paramNames as $index => $name) {
                $params[$name] = isset($matches[$index]) ? urldecode($matches[$index]) : null;
            }

            return [$handler, $params];
        }

        return [null, []];
    }

    protected function routePattern(string $routePath, array &$paramNames): string
    {
        $routePath = $this->normalizePath($routePath);

        if ($routePath === '/') {
            return '#^/$#';
        }

        $segments = explode('/', trim($routePath, '/'));
        $parts = [];

        foreach ($segments as $segment) {
            if (preg_match('/^\{([A-Za-z_][A-Za-z0-9_]*)\}$/', $segment, $matches)) {
                $paramNames[] = $matches[1];
                $parts[] = '([^/]+)';
                continue;
            }

            $parts[] = preg_quote($segment, '#');
        }

        return '#^/' . implode('/', $parts) . '$#';
    }

    public function dispatch(): void
    {
        $method = $this->request->method();
        $path = $this->normalizePath($this->request->path());

        [$handler, $params] = $this->resolveRoute($method, $path);

        if ($handler === null) {
            $this->response
                ->setStatusCode(404)
                ->html('<h1>404 Not Found</h1><p>The page you requested does not exist.</p>', 404);
            return;
        }

        if ($handler instanceof Closure) {
            call_user_func($handler, $this->request, $this->response, ...array_values($params));
            return;
        }

        if (is_array($handler) && count($handler) === 2) {
            [$controllerClass, $methodName] = $handler;

            if (!class_exists($controllerClass)) {
                $this->response
                    ->setStatusCode(500)
                    ->html('<h1>500 Server Error</h1><p>Controller class not found.</p>', 500);
                return;
            }

            $controller = new $controllerClass();

            if (!method_exists($controller, $methodName)) {
                $this->response
                    ->setStatusCode(500)
                    ->html('<h1>500 Server Error</h1><p>Controller method not found.</p>', 500);
                return;
            }

            call_user_func([$controller, $methodName], ...array_values($params));
            return;
        }

        $this->response
            ->setStatusCode(500)
            ->html('<h1>500 Server Error</h1><p>Invalid route handler.</p>', 500);
    }

    public function routes(): array
    {
        return $this->routes;
    }
}
