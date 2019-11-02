#!/bin/bash


docker build -t simplycodedsoftware/debian:latest Debian/Base \
&& docker build -t simplycodedsoftware/php:7.3 Debian/PHP/7.3/Fpm \
&& docker build -t simplycodedsoftware/ci:7.3 Debian/PHP/7.3/CI \
&& docker build -t simplycodedsoftware/nginx:backend Debian/Nginx \
&& docker push simplycodedsoftware/debian:latest \
&& docker push simplycodedsoftware/php:7.3 \
&& docker push simplycodedsoftware/ci:7.3 \
&& docker push simplycodedsoftware/nginx:backend
