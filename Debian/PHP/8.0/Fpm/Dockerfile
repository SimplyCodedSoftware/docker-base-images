FROM simplycodedsoftware/debian:latest

ENV COMPOSER_HOME /var/www/.composer
ENV COMPOSE_HTTP_TIMEOUT=3600
ENV APP_ENV="dev"

#FROM php:8.0-rc-cli

#RUN mkdir -p /usr/src/php/ext/xdebug && curl -fsSL https://pecl.php.net/get/xdebug | tar xvz -C "/usr/src/php/ext/xdebug" --strip 1 && docker-php-ext-install xdebug
#RUN docker-php-ext-enable xdebug

#RUN mkdir -p /usr/src/php/ext/pdo_pgsql && apt-get update && apt-get install libpq-dev -yqq && curl -fsSL https://pecl.php.net/get/pdo_pgsql | tar xvz -C "/usr/src/php/ext/pdo_pgsql" --strip 1 && docker-php-ext-install pdo_pgsql
#RUN docker-php-ext-enable pdo_pgsql

#RUN apt-get update && apt-get install librabbitmq-dev libssh-dev -yqq && docker-php-ext-install bcmath sockets
#RUN git clone https://github.com/pdezwart/php-amqp.git github-pdezwart-php-amqp/
#RUN cd github-pdezwart-php-amqp && phpize && ./configure --with-librabbitmq-dir=/usr/local/Cellar/rabbitmq-c/0.10.0 && make && make install

#RUN mkdir -p /usr/src/php/ext/amqp  && curl -fsSL https://pecl.php.net/get/amqp | tar xvz -C "/usr/src/php/ext/amqp" --strip 1 && docker-php-ext-install amqp
#RUN docker-php-ext-enable amqp

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
RUN chmod +x /usr/local/bin/xdebug

CMD ["php-fpm", "--nodaemonize"]