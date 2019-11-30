#!/usr/bin/env bash

echo "Enabling debug mode"

sed -i "s/xdebug.remote_host=172.17.0.1/xdebug.remote_host=$PHP_XDEBUG_REMOTE_HOST/g" /etc/php/7.4/mods-available/xdebug.ini;
sed -i 's/xdebug.remote_autostart=0/xdebug.remote_autostart=1/g' /etc/php/7.4/mods-available/xdebug.ini;
phpenmod xdebug;

supervisorctl restart all;