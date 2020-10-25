FROM php:8.0.0rc1-fpm

ENV PHP_XDEBUG_REMOTE_HOST 172.17.0.1
ENV COMPOSER_HOME /var/www/.composer
ENV COMPOSE_HTTP_TIMEOUT=3600
ENV APP_ENV="dev"

WORKDIR /data/app

RUN apt-get update \
    && apt-get install -yqq --no-install-recommends curl zip git ca-certificates openssh-client less vim supervisor git \
    && useradd -g 33 -ou 1000 -m deploy

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer \
    && composer self-update --2 \
    && mkdir -p /var/www/.composer/cache/vcs \
    && chown www-data:www-data -R /var/www/.composer

CMD ["php-fpm", "--nodaemonize"]