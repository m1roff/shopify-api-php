FROM php:8.3-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    libzip-dev \
    libonig-dev \
    && rm -rf /var/lib/apt/lists/*

# Install required PHP extensions
RUN docker-php-ext-install \
    ctype \
    zip \
    mbstring

# JSON is now part of PHP core, no need to install it separately

# Install APCu extension (mentioned in composer.json suggest and symbol-whitelist)
RUN pecl install apcu && \
    docker-php-ext-enable apcu

# Install Nginx
RUN apt-get update && apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Configure Nginx
COPY .docker/nginx.conf /etc/nginx/sites-available/default

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /app

# Copy application code
#COPY . /var/www/html/
#COP
# Install dependencies
RUN #composer install --no-interaction --optimize-autoloader

# Expose port 80 (standard for Nginx)
EXPOSE 80

COPY .docker/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

CMD ["docker-entrypoint.sh"]
