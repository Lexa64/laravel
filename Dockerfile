FROM php:8.3-fpm

WORKDIR /var/www

RUN apt -y update

RUN apt install -y nodejs npm libzip-dev --no-install-recommends \
    && pecl install xdebug \
    && docker-php-ext-install pdo pdo_mysql zip \
    && docker-php-ext-enable xdebug

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

