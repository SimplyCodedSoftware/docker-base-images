#!/bin/bash


docker build --pull -t simplycodedsoftware/debian:latest Debian/Base \
&& docker push simplycodedsoftware/debian:latest \
&& docker build --pull -t simplycodedsoftware/php:8.0 Debian/PHP/8.0/Fpm \
&& docker push simplycodedsoftware/php:8.0 \
&& docker build --pull -t simplycodedsoftware/nginx-php:8.0 Debian/PHP/8.0/Fpm-Nginx \
&& docker push simplycodedsoftware/nginx-php:8.0 \
&& docker build -t simplycodedsoftware/nginx:php-8.0 Debian/PHP/8.0/Fpm-Nginx \
&& docker build -t simplycodedsoftware/nginx:backend Debian/Nginx/backend \
&& docker build -t simplycodedsoftware/nginx:frontend Debian/Nginx/frontend \
&& docker build -t simplycodedsoftware/npm:latest Debian/Node/Latest \
&& docker push simplycodedsoftware/debian:latest \
&& docker push simplycodedsoftware/php:8.0 \
&& docker push simplycodedsoftware/nginx:php-8.0 \
&& docker push simplycodedsoftware/nginx:backend \
&& docker push simplycodedsoftware/nginx:frontend \
&& docker push simplycodedsoftware/npm:latest