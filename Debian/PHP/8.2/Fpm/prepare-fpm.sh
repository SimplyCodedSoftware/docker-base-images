#!/usr/bin/env bash

if [ "$(id -u)" = "0" ]; then mkdir -p /run/php && touch /var/log/php8.1-fpm.log && chown 1000:1000 /var/log/php8.1-fpm.log; fi