!/bin/bash


docker build -t simplycodedsoftware/debian:latest Debian/Base \
&& docker build -t simplycodedsoftware/php:8.0 Debian/PHP/8.0/Fpm \
&& docker build -t simplycodedsoftware/nginx:php-8.0 Debian/PHP/8.0/Fpm-Nginx \
&& docker build -t simplycodedsoftware/php:7.4 Debian/PHP/7.4/Fpm \
&& docker build -t simplycodedsoftware/ci:7.4 Debian/PHP/7.4/CI \
&& docker build -t simplycodedsoftware/nginx:php-7.4 Debian/PHP/7.4/Fpm-Nginx \
&& docker build -t simplycodedsoftware/php:7.3 Debian/PHP/7.3/Fpm \
&& docker build -t simplycodedsoftware/ci:7.3 Debian/PHP/7.3/CI \
&& docker build -t simplycodedsoftware/nginx:php-7.3 Debian/PHP/7.3/Fpm-Nginx \
&& docker build -t simplycodedsoftware/nginx:backend Debian/Nginx/backend \
&& docker build -t simplycodedsoftware/nginx:frontend Debian/Nginx/frontend \
&& docker build -t simplycodedsoftware/npm:latest Debian/Node/Latest \
&& docker push simplycodedsoftware/debian:latest \
&& docker push simplycodedsoftware/php:7.4 \
&& docker push simplycodedsoftware/ci:7.4 \
&& docker push simplycodedsoftware/nginx:php-7.4 \
&& docker push simplycodedsoftware/php:7.3 \
&& docker push simplycodedsoftware/ci:7.3 \
&& docker push simplycodedsoftware/nginx:php-7.3 \
&& docker push simplycodedsoftware/nginx:backend \
&& docker push simplycodedsoftware/nginx:frontend \
&& docker push simplycodedsoftware/npm:latest