#!/usr/bin/env bash

if [ "$(id -u)" = "0" ]; then mkdir -p /run/php && touch /var/log/php8.3-fpm.log && chown 1000:1000 /var/log/php8.3-fpm.log; fi