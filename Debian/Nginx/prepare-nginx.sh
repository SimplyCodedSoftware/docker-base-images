#!/usr/bin/env bash

mkdir -p /var/log/nginx && touch /var/log/nginx/error.log /var/log/nginx/app_error.log /var/log/nginx/app_access.log

sed -i "s/127.0.0.11/$RESOLVER_IP/g" /etc/nginx/sites-available/app.conf
sed -i "s/backend-dns/$BACKEND_DNS/g" /etc/nginx/sites-available/app.conf
