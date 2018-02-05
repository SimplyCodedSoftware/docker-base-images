#!/bin/bash


docker build -t simplycodedsoftware/debian:latest Debian/Base \
&& docker build -t simplycodedsoftware/php:7.1 Debian/PHP/7.1/Fpm \
&& docker build -t simplycodedsoftware/ci:7.1 Debian/PHP/7.1/CI
