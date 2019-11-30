#!/usr/bin/env bash

phpdismod xdebug;

supervisorctl restart all;

echo "Debug mode disabled";