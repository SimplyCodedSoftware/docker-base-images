#!/bin/bash


docker build -t simplycodedsoftware/debian:latest Debian/Base \
&& docker push simplycodedsoftware/debian:latest \
&& docker build -t simplycodedsoftware/php:7.3 Debian/PHP/7.3/Fpm \
&& docker push simplycodedsoftware/php:7.3 \
&& docker build -t simplycodedsoftware/ci:7.3 Debian/PHP/7.3/CI \
&& docker push simplycodedsoftware/ci:7.3 \
&& docker build -t simplycodedsoftware/nginx:backend Debian/Nginx \
&& docker push simplycodedsoftware/nginx:backend \
&& docker build -t simplycodedsoftware/nginx:php-7.3 Debian/PHP/7.3/Fpm-Nginx \
&& docker push simplycodedsoftware/nginx:php-7.3
