#!/bin/bash

set -e

rm -rf var/cache/*

if [ "$(id -u)" = "0" ] && [ "$APP_MERGE_PLUGIN" = "yes" ]; then
  composer global require wikimedia/composer-merge-plugin \
; fi

if [ "$(id -u)" = "0" ] && [ "$APP_INSTALL_DEPENDENCIES" = "yes" ]; then
   echo "Installing fresh dependencies" \
   && su deploy -c "(composer install --ignore-platform-reqs --no-interaction --optimize-autoloader)" \
   && echo "Dependencies installed"
elif [ "$APP_INSTALL_DEPENDENCIES" = "yes" ]; then
    echo "Installing fresh dependencies" \
    && composer install --ignore-platform-reqs --no-interaction --optimize-autoloader \
    && echo "Dependencies installed"
else
    echo "Not installing dependencies" \
; fi