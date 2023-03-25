FROM simplycodedsoftware/debian:latest

ENV COMPOSER_HOME /var/www/.composer
ENV COMPOSE_HTTP_TIMEOUT=3600
ENV APP_ENV="dev"
ENV APP_INSTALL_DEPENDENCIES="false"
ENV PHP_IDE_CONFIG="serverName=project"
ENV XDEBUG_PORT=9003

RUN apt-get update \
    && apt-get install lsb-release ca-certificates apt-transport-https software-properties-common wget -y \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
    && apt-get update \
    && apt-get install php8.2-cli php8.2-fpm php8.2-common php8.2-curl php8.2-amqp php8.2-fpm php8.2-mysql php8.2-pgsql php8.2-mbstring php8.2-bcmath php8.2-xdebug php8.2-opcache php8.2-opcache php8.2-zip php8.2-xml php8.2-readline php8.2-sqlite3 php8.2-grpc php8.2-protobuf --no-install-recommends -yqq \
    && usermod -ou 1000 -g www-data www-data \
    && chsh -s /bin/sh www-data \
    && phpdismod xdebug \
    && cleanup

RUN sed -i -e 's/\/run\/php\/php8\.1-fpm\.sock/0\.0\.0\.0:9000/g' /etc/php/8.2/fpm/pool.d/www.conf \
    && sed -i 's/;clear_env = no/clear_env = no/g' /etc/php/8.2/fpm/pool.d/www.conf \
    && touch /var/log/php8.2-fpm.log \
    && chown 1000:1000 /var/log/php8.2-fpm.log

ADD prepare-fpm.sh /data/entrypoint.d/1_prepare-fpm.sh
ADD install-dependencies.sh /data/entrypoint.d/2_install-dependencies.sh
ADD xdebug-entrypoint.sh /data/entrypoint.d/3_xdebug-entrypoint.sh
RUN chmod +x /data/entrypoint.d/1_prepare-fpm.sh /data/entrypoint.d/2_install-dependencies.sh /data/entrypoint.d/3_xdebug-entrypoint.sh

WORKDIR /data/app

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer \
    && mkdir -p /var/www/.composer/cache/vcs \
    && chown www-data:www-data -R /var/www/.composer \
    && /usr/local/bin/composer self-update

ADD xdebug.ini /etc/php/8.2/mods-available/xdebug.ini
ADD xdebug /usr/local/bin/xdebug
RUN chmod +x /usr/local/bin/xdebug

CMD ["php-fpm", "--nodaemonize"]