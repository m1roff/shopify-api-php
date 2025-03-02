<?php

declare(strict_types=1);

namespace Shopify\Configuration;

use Closure;
use Shopify\Clients\Http;
use Shopify\Utils;

final readonly class OAuthCallbackConfiguration
{

    private ?string $sanitizedShop;

    public function getSanitizedShop(): ?string
    {
        return $this->sanitizedShop;
    }

    public function __construct(
        private array $cookies,
        private array $query,
        private Http $shopifyHttpClient,
        private ?Closure $setCookieFunction = null,
    )
    {
        $this->sanitizedShop = Utils::sanitizeShopDomain($query['shop'] ?? '');
    }

    public function getCookies(): array
    {
        return $this->cookies;
    }

    public function getQuery(): array
    {
        return $this->query;
    }

    public function getShopifyHttpClient(): Http
    {
        return $this->shopifyHttpClient;
    }

    public function getSetCookieFunction(): ?callable
    {
        return $this->setCookieFunction;
    }
}