FROM simplycodedsoftware/debian:latest

ENV PHP_XDEBUG_REMOTE_HOST 172.17.0.1
ENV COMPOSER_HOME /var/www/.composer

RUN apt-get update -qq && apt-get install --no-install-recommends -qqy apt-utils curl python-setuptools wget apt-transport-https lsb-release ca-certificates -y \
	&& wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
	&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yqq \
	    php7.3 php7.3-cli php7.3-fpm php7.3-common php7.3-curl php7.3-fpm php7.3-json php7.3-mysql php7.3-pgsql php7.3-mongodb php7.3-mbstring php7.3-bcmath php7.3-xdebug php7.3-redis php7.3-opcache \
    && usermod -ou 1000 -g www-data www-data \
    && chsh -s /bin/sh www-data \
    && phpdismod xdebug \
	&& cleanup

RUN sed -i -e 's/\/run\/php\/php7\.3-fpm\.sock/0\.0\.0\.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf \
    && sed -i 's/;clear_env = no/clear_env = no/g' /etc/php/7.3/fpm/pool.d/www.conf \
    && touch /var/log/php7.3-fpm.log \
    && chown 1000:1000 /var/log/php7.3-fpm.log \
# enabling opcache with bigger storage
    && sed -i 's/\;opcache.enable=1/opcache.enable=1/g' /etc/php/7.3/fpm/php.ini \
    && sed -i 's/\;opcache.memory_consumption=128/opcache.memory_consumption=256/g' /etc/php/7.3/fpm/php.ini \
    && sed -i 's/\;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=20000/g' /etc/php/7.3/fpm/php.ini \
# utc datetime
    && sed -i 's/\;date.timezone =/date.timezone=UTC/g' /etc/php/7.3/fpm/php.ini \
    && sed -i 's/\;date.timezone =/date.timezone=UTC/g' /etc/php/7.3/cli/php.ini \
    && phpdismod opcache \
    && mkdir -p /run/php \
    && cleanup

RUN echo "zend_extension=xdebug.so" > /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.default_enable = 1" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.remote_enable = 1" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.remote_handler = dbgp" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.remote_autostart = 0" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.remote_connect_back = 1" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.remote_port = 9000" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.remote_host = 172.17.0.1" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.profiler_enable=0" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.profiler_enable_trigger=1" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "xdebug.profiler_output_dir=\"/tmp\"" >> /etc/php/7.3/mods-available/xdebug.ini && \
    echo "extension=ast.so" > /etc/php/7.3/mods-available/ast.ini

ADD opcache-mode.sh /data/entrypoint.d/opcache-mode.sh
ADD debug-mode.sh /usr/local/bin/debug-mode.sh
ADD debug-mode-off.sh /usr/local/bin/debug-mode-off.sh
RUN chmod +x /data/entrypoint.d/opcache-mode.sh /usr/local/bin/debug-mode.sh /usr/local/bin/debug-mode-off.sh

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN /usr/local/bin/composer global require "hirak/prestissimo" \
    && mkdir -p /var/www/.composer/cache/vcs \
    && chown www-data:www-data -R /var/www/.composer \
    && su deploy -c '/usr/local/bin/composer global require "hirak/prestissimo"'


CMD ["php-fpm7.3", "--nodaemonize"]