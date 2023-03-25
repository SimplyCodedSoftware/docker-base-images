#!/bin/sh

set -e

if [ "$XDEBUG_ENABLED" = "1" ]; then
    XDEBUG_HOST=${XDEBUG_HOST:-$(route -n | egrep "^0.0.0.0" | awk '{print $2}')}

    if [ "$XDEBUG_HOST" = "" ]; then
        echo "Host not found";
        exit 1;
    fi

    echo "XDebug ${XDEBUG_HOST}:${XDEBUG_PORT}"
    echo "zend_extension=xdebug.so

xdebug.mode = debug
xdebug.start_with_request = 1
xdebug.client_host = ${XDEBUG_HOST}
xdebug.client_port = ${XDEBUG_PORT:-9003}
xdebug.idekey = ${XDEBUG_IDE_KEY:-PHPSTORM}
xdebug.max_nesting_level = 999999" > /etc/php/8.2/mods-available/xdebug.ini
phpenmod xdebug;
else
    echo "Xdebug disabled"
fi
