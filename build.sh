#!/bin/bash


docker buildx build --platform linux/amd64,linux/arm64 --push --pull -t simplycodedsoftware/debian:latest Debian/Base \
&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.0 Debian/PHP/8.0/Fpm \
&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.0 Debian/PHP/8.0/Fpm-Nginx \
&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.1 Debian/PHP/8.1/Fpm \
&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.1 Debian/PHP/8.1/Fpm-Nginx \
&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.2 Debian/PHP/8.2/Fpm \
&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.2 Debian/PHP/8.2/Fpm-Nginx
#\
#&& docker build --pull -t simplycodedsoftware/nginx:frontend Debian/Nginx/frontend \
#&& docker push simplycodedsoftware/nginx:frontend \
#&& docker build --pull -t simplycodedsoftware/npm:latest Debian/Node/Latest \
#&& docker push simplycodedsoftware/npm:latest