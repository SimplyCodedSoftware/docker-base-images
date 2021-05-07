FROM simplycodedsoftware/debian:latest

ENV COMPOSER_HOME /var/www/.composer
ENV COMPOSE_HTTP_TIMEOUT=3600
ENV APP_ENV="dev"

RUN apt-get update \
    && apt-get install lsb-release ca-certificates apt-transport-https software-properties-common wget -y \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
    && apt-get update \
    && apt-get install php8.0-cli php8.0-fpm php8.0-common php8.0-curl php8.0-amqp php8.0-fpm php8.0-mysql php8.0-pgsql php8.0-mbstring php8.0-bcmath php8.0-xdebug php8.0-opcache php8.0-opcache php8.0-zip php8.0-xml php8.0-readline php8.0-sqlite3 --no-install-recommends -yqq \
    && usermod -ou 1000 -g www-data www-data \
    && chsh -s /bin/sh www-data \
#    && phpdismod xdebug \
    && cleanup

WORKDIR /data/app

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer \
    && composer self-update --2 \
    && mkdir -p /var/www/.composer/cache/vcs \
    && chown www-data:www-data -R /var/www/.composer

ADD xdebug /usr/local/bin/xdebug
ADD xdebug.ini /etc/php/8.0/mods-available/xdebug.ini
RUN chmod +x /usr/local/bin/xdebug

CMD ["php-fpm", "--nodaemonize"]