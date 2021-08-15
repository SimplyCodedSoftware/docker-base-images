FROM 8.1.0beta2-fpm-alpine

# BASE
ENV DEBIAN_FRONTEND=noninteractive

RUN touch /etc/apt/apt.conf \
    && echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf \
    && echo 'APT::Install-Suggests "0";'  > /etc/apt/apt.conf

ADD entrypoint /usr/local/bin/entrypoint
ADD wait4tcp /usr/local/bin/wait4tcp
ADD cleanup /usr/local/bin/cleanup
ADD start-supervisor.sh /usr/local/bin/start-supervisor

RUN chmod +x /usr/local/bin/entrypoint /usr/local/bin/wait4tcp /usr/local/bin/cleanup /usr/local/bin/start-supervisor

RUN apt-get update \
    && apt-get install -yqq --no-install-recommends curl zip git ca-certificates openssh-client less vim supervisor git \
    && useradd -g 33 -ou 1000 -m deploy \
    && cleanup

ENTRYPOINT ["/usr/local/bin/entrypoint"]
# END BASE

ENV COMPOSER_HOME /var/www/.composer
ENV COMPOSE_HTTP_TIMEOUT=3600
ENV APP_ENV="dev"
ENV PHP_IDE_CONFIG="serverName=_"
ENV XDEBUG_IDE_KEY="PHPSTORM"
ENV APP_INSTALL_DEPENDENCIES="false"

RUN apt-get update \
    && apt-get install lsb-release ca-certificates apt-transport-https software-properties-common wget -y \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
    && apt-get update \
    && apt-get install php8.1-cli php8.1-fpm php8.1-common php8.1-curl php8.1-amqp php8.1-fpm php8.1-mysql php8.1-pgsql php8.1-mbstring php8.1-bcmath php8.1-xdebug php8.1-opcache php8.1-opcache php8.1-zip php8.1-xml php8.1-readline php8.1-sqlite3 --no-install-recommends -yqq \
    && usermod -ou 1000 -g www-data www-data \
    && chsh -s /bin/sh www-data \
    && phpdismod xdebug \
    && cleanup

RUN sed -i -e 's/\/run\/php\/php8\.0-fpm\.sock/0\.0\.0\.0:9000/g' /etc/php/8.1/fpm/pool.d/www.conf \
    && sed -i 's/;clear_env = no/clear_env = no/g' /etc/php/8.1/fpm/pool.d/www.conf \
    && touch /var/log/php8.1-fpm.log \
    && chown 1000:1000 /var/log/php8.1-fpm.log

ADD prepare-fpm.sh /data/entrypoint.d/1_prepare-fpm.sh
ADD install-dependencies.sh /data/entrypoint.d/2_install-dependencies.sh
RUN chmod +x /data/entrypoint.d/1_prepare-fpm.sh /data/entrypoint.d/2_install-dependencies.sh

WORKDIR /data/app

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer \
    && mkdir -p /var/www/.composer/cache/vcs \
    && chown www-data:www-data -R /var/www/.composer \
    && /usr/local/bin/composer self-update

ADD xdebug.ini /etc/php/8.1/mods-available/xdebug.ini
ADD xdebug /usr/local/bin/xdebug
RUN chmod +x /usr/local/bin/xdebug

CMD ["php-fpm", "--nodaemonize"]