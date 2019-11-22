#!/bin/bash

set -e

rm -rf var/cache/*

if [ "$CI" = "true" ]; then \
    echo "Running as CI" \
    && exit 0 \
; fi

if [ "$(id -u)" = "0" ] && [ "$APP_INSTALL_DEPENDENCIES" != "no" ]; then
   echo "installing fresh dependencies" \
   && su deploy -c "(composer install --ignore-platform-reqs --no-interaction --optimize-autoloader)" \
; fi