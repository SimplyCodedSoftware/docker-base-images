#!/usr/bin/env bash

mkdir -p /var/log/nginx \
    && touch /var/log/nginx/error.log /var/log/nginx/app_error.log /var/log/nginx/app_access.log