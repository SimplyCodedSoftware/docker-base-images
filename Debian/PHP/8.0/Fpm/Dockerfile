FROM php:8.0.0alpha2

ENV PHP_XDEBUG_REMOTE_HOST 172.17.0.1
ENV COMPOSER_HOME /var/www/.composer
ENV COMPOSE_HTTP_TIMEOUT=3600
ENV APP_ENV="dev"

WORKDIR /data/app

RUN apt-get update \
    && apt-get install -yqq --no-install-recommends curl zip git ca-certificates openssh-client less vim supervisor git \
    && useradd -g 33 -ou 1000 -m deploy

#RUN sed -i -e 's/\/run\/php\/php-fpm\.sock/0\.0\.0\.0:9000/g' /etc/php/8.0/fpm/pool.d/www.conf \
#    && sed -i 's/;clear_env = no/clear_env = no/g' /etc/php/8.0/fpm/pool.d/www.conf \
#    && touch /var/log/php8.0-fpm.log \
#    && chown 1000:1000 /var/log/php8.0-fpm.log \
#    # utc datetime
#    && sed -i 's/\;date.timezone =/date.timezone=UTC/g' /usr/local/etc/php/php.ini-development \
#    && sed -i 's/\;date.timezone =/date.timezone=UTC/g' /usr/local/etc/php/php.ini-production \
#    && mkdir -p /run/php \
#    && cleanup

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer \
    && composer self-update --2 \
    && mkdir -p /var/www/.composer/cache/vcs \
    && chown www-data:www-data -R /var/www/.composer

CMD ["php-fpm", "--nodaemonize"]