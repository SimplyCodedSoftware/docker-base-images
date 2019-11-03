#!/bin/bash

set -e

rm -rf var/cache/*

if [ "$CI" = "true" ]; then \
    echo "Running as CI" \
    && exit 0 \
; fi

echo "installing fresh dependencies"
if [ "$(id -u)" = "0" ] && [ "$APP_ENV" = "dev" ]; then
   su deploy -c "(composer install --ignore-platform-reqs --no-interaction)" \
; fi