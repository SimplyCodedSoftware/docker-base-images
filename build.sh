#!/bin/bash

# build and local locally
#docker buildx build --platform linux/amd64 --load -t simplycodedsoftware/php:8.1.25 Debian/PHP/8.1/Fpm \
#&&  docker buildx build --platform linux/amd64 --load -t simplycodedsoftware/nginx-php:8.1.25 Debian/PHP/8.1/Fpm-Nginx \
#&&  docker buildx build --platform linux/amd64 --load -t simplycodedsoftware/php:8.2.12 Debian/PHP/8.2/Fpm \
#&&  docker buildx build --platform linux/amd64 --load -t simplycodedsoftware/nginx-php:8.2.12 Debian/PHP/8.2/Fpm-Nginx

# build and push
docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.1.25 Debian/PHP/8.1/Fpm \
&&  docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.1.25 Debian/PHP/8.1/Fpm-Nginx \
&&  docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.2.12 Debian/PHP/8.2/Fpm \
&&  docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.2.12 Debian/PHP/8.2/Fpm-Nginx