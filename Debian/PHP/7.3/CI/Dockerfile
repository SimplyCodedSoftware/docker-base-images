FROM simplycodedsoftware/php:7.3

RUN apt-get update && apt-get install -yqq --no-install-recommends php7.3-dev php-pear build-essential \
    && pecl install ast \
    && apt-get purge php7.3-dev php-pear build-essential -yqq \
    && cleanup

RUN phpenmod xdebug ast