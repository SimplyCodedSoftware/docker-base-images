FROM simplycodedsoftware/debian:latest

RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yqq --no-install-recommends php7.1 php7.1-mbstring php7.1-bcmath php7.1-xml php7.1-json php7.1-xdebug php7.1-fpm \
    && usermod -ou 1000 -g www-data www-data \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/\/run\/php\/php7\.1-fpm\.sock/0\.0\.0\.0:9000/g' /etc/php/7.1/fpm/pool.d/www.conf \
    && touch /var/log/php7.1-fpm.log \
    && chown 1000:1000 /var/log/php7.1-fpm.log \
    && mkdir -p /run/php \
    && cleanup

RUN curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar && \
	chmod +x /usr/local/bin/composer

CMD ["php-fpm7.1", "--nodaemonize"]