#!/bin/bash

# build and local locally
#docker build -t simplycodedsoftware/php:8.1.29 Debian/PHP/8.1/Fpm \
#&&  docker build -t simplycodedsoftware/nginx-php:8.1.29 Debian/PHP/8.1/Fpm-Nginx \
#&& docker build -t simplycodedsoftware/php:8.2.29 Debian/PHP/8.2/Fpm \
#&&  docker build -t simplycodedsoftware/nginx-php:8.2.29 Debian/PHP/8.2/Fpm-Nginx

# configure multi-arch build
# docker buildx create --name mybuilder --use
# docker buildx inspect mybuilder --bootstrap

# build and push
#docker buildx build --builder mybuilder --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.0.31 Debian/PHP/8.0/Fpm \
#&& docker buildx build --builder mybuilder --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.0.31 Debian/PHP/8.0/Fpm-Nginx \
#&& docker buildx build --builder mybuilder --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.1.30 Debian/PHP/8.1/Fpm \
#&& docker buildx build --builder mybuilder --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.1.30 Debian/PHP/8.1/Fpm-Nginx \
#&& docker buildx build --builder mybuilder --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.2.30 Debian/PHP/8.2/Fpm \
#&& docker buildx build --builder mybuilder --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.2.30 Debian/PHP/8.2/Fpm-Nginx \
#&& docker buildx build --builder mybuilder --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/php:8.3.11 Debian/PHP/8.3/Fpm \
#&& docker buildx build --builder mybuilder --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/nginx-php:8.3.11 Debian/PHP/8.3/Fpm-Nginx \
#&& without ,linux/arm64 yet because grpc fails
docker buildx build --builder mybuilder --platform linux/amd64 --push -t simplycodedsoftware/php:8.4.6 Debian/PHP/8.4/Fpm \
&& docker buildx build --builder mybuilder --platform linux/amd64 --push -t simplycodedsoftware/nginx-php:8.4.6 Debian/PHP/8.4/Fpm-Nginx