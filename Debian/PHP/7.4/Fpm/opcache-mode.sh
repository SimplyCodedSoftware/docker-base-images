#!/usr/bin/env bash

if [ "$(id -u)" = "0" ]; then
    if [ "$APP_ENV" = "prod" ]; then echo "Enabling production settings...";  fi
    if [ "$APP_ENV" = "prod" ]; then sed -i 's/\;opcache.validate_timestamps=0/opcache.validate_timestamps=0/g' /etc/php/7.4/fpm/php.ini;  fi
    # caching resolved paths
    if [ "$APP_ENV" = "prod" ]; then sed -i 's/\;realpath_cache_size/realpath_cache_size/g' /etc/php/7.4/fpm/php.ini;  fi
    if [ "$APP_ENV" = "prod" ]; then sed -i 's/\;realpath_cache_ttl = 120/realpath_cache_ttl=600/g' /etc/php/7.4/fpm/php.ini;  fi
    if [ "$APP_ENV" = "prod" ]; then echo "Production settings enabled.";  fi
fi