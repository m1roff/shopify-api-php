#!/bin/bash
set -e

# Start Nginx
service nginx start

# Start PHP-FPM in foreground to keep container running
exec php-fpm