FROM simplycodedsoftware/php:7.1

RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yqq --no-install-recommends \
        php7.1-common \
        php7.1-gd \
        php7.1-curl \
        php7.1-enchant \
        php7.1-fpm \
        php7.1-intl \
        php7.1-ldap \
        php7.1-mcrypt \
        php7.1-mysql \
        php7.1-odbc \
        php7.1-pgsql \
        php7.1-readline \
        php7.1-sqlite3 \
        php7.1-sybase \
        php7.1-tidy \
        php7.1-xmlrpc \
        php7.1-xsl \
        php7.1-memcached \
        php7.1-imagick \
        php7.1-soap \
        php7.1-mbstring \
        php7.1-bcmath \
        php7.1-xdebug \
        php7.1-redis \
        php7.1-zip \
    && cleanup


RUN apt-get update && apt-get install -yqq --no-install-recommends php7.1-dev php-pear build-essential \
    && pecl install ast \
    && apt-get purge php7.1-dev php-pear build-essential -yqq \
    && cleanup

RUN echo "zend_extension=xdebug.so" > /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.default_enable = 1" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.remote_enable = 1" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.remote_handler = dbgp" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.remote_autostart = 0" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.remote_connect_back = 1" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.remote_port = 9000" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.remote_host = 172.17.0.1" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.profiler_enable=0" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.profiler_enable_trigger=1" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "xdebug.profiler_output_dir=\"/tmp\"" >> /etc/php/7.1/mods-available/xdebug.ini && \
    echo "extension=ast.so" > /etc/php/7.1/mods-available/ast.ini

RUN phpenmod xdebug ast