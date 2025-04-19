FROM php:8.4-cli

RUN apt-get update && apt-get install -y zip vim less && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pcntl --enable-pcntl \
  && docker-php-ext-install pcntl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENTRYPOINT []
