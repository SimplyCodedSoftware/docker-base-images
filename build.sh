#!/bin/bash

# build and local locally
#docker build -t simplycodedsoftware/php:8.1.29 Debian/PHP/8.1/Fpm \
#&&  docker build -t simplycodedsoftware/nginx-php:8.1.29 Debian/PHP/8.1/Fpm-Nginx \
#&& docker build -t simplycodedsoftware/php:8.2.29 Debian/PHP/8.2/Fpm \
#&&  docker build -t simplycodedsoftware/nginx-php:8.2.29 Debian/PHP/8.2/Fpm-Nginx

# build and push
#docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.0.30 Debian/PHP/8.0/Fpm \
#&&
docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.0.30 Debian/PHP/8.0/Fpm-Nginx \
&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.1.29 Debian/PHP/8.1/Fpm \
&&  docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.1.29 Debian/PHP/8.1/Fpm-Nginx \
&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.2.29 Debian/PHP/8.2/Fpm \
&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.2.29 Debian/PHP/8.2/Fpm-Nginx
#\
#&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.3.10 Debian/PHP/8.3/Fpm \
#&& docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.3.10 Debian/PHP/8.3/Fpm-Nginx