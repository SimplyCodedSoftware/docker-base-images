#!/usr/bin/env bash

if [ "$(id -u)" = "0" ]; mkdir -p /var/lib/nginx/body /var/log/nginx && touch /var/log/nginx/error.log /var/log/nginx/app_error.log /var/log/nginx/app_access.log; fi