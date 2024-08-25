FROM php:8.3.10-fpm-bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN touch /etc/apt/apt.conf \
    && echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf \
    && echo 'APT::Install-Suggests "0";'  > /etc/apt/apt.conf

ADD Common/entrypoint /usr/local/bin/entrypoint
ADD Common/wait4tcp /usr/local/bin/wait4tcp
ADD Common/start-supervisor.sh /usr/local/bin/start-supervisor
RUN chmod +x /usr/local/bin/entrypoint /usr/local/bin/wait4tcp /usr/local/bin/start-supervisor

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -yqq --no-install-recommends curl zip git ca-certificates openssh-client less vim supervisor git net-tools \
    && useradd -g 33 -ou 1000 -m deploy

RUN echo 'memory_limit = 256M' >> /usr/local/etc/php/conf.d/docker-php-ram-limit.ini

ENTRYPOINT ["/usr/local/bin/entrypoint"]

ENV COMPOSER_HOME=/var/www/.composer
ENV COMPOSE_HTTP_TIMEOUT=3600
ENV APP_ENV="dev"
ENV APP_INSTALL_DEPENDENCIES="false"
ENV PHP_IDE_CONFIG="serverName=project"
ENV XDEBUG_PORT=9003

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd xdebug redis curl amqp pgsql pdo_mysql pdo_pgsql mbstring bcmath opcache zip xml readline sqlite3 grpc protobuf opentelemetry rdkafka

ADD prepare-fpm.sh /data/entrypoint.d/1_prepare-fpm.sh
ADD Common/install-dependencies.sh /data/entrypoint.d/2_install-dependencies.sh
ADD Common/xdebug-entrypoint.sh /data/entrypoint.d/3_xdebug-entrypoint.sh
RUN chmod +x /data/entrypoint.d/1_prepare-fpm.sh /data/entrypoint.d/2_install-dependencies.sh /data/entrypoint.d/3_xdebug-entrypoint.sh

WORKDIR /data/app

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer \
    && mkdir -p /var/www/.composer/cache/vcs \
    && chown www-data:www-data -R /var/www/.composer \
    && /usr/local/bin/composer self-update

ADD Common/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
ADD Common/xdebug /usr/local/bin/xdebug
RUN chmod +x /usr/local/bin/xdebug

CMD ["php-fpm", "--nodaemonize"]