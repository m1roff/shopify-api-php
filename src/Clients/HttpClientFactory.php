<?php

declare(strict_types=1);

namespace Shopify\Clients;

use GuzzleHttp\Client;
use Psr\Http\Client\ClientInterface;

/**
 * @deprecated Uneccesary class, Client easyli could be mocked with Mocking client itself
 */
class HttpClientFactory
{
    /**
     * @codeCoverageIgnore This is mocked for tests
     */
    public function client(): ClientInterface
    {
        return new Client();
    }
}
