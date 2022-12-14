#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ "$(hostname)" == "mcs1" ]; then
    sleep 5
    mariadb -h xpd1 -u xpand < /tmp/sql/xpand.sql
    if [ $? -eq 0 ]; then
        printf "Installing Sample Xpand Tables... ${GREEN}done${NC}\n"
    else
        echo "Installing Sample Xpand Tables... ${RED}fail${NC}\n"
        exit 1
    fi
    provision
    sleep 5
    mariadb < /tmp/sql/mariadb.sql
    if [ $? -eq 0 ]; then
        printf "Installing Sample MariaDB Tables... ${GREEN}done${NC}\n"
        exit 0
    else
        printf "Installing Sample MariaDB Tables... ${RED}fail${NC}\n"
        exit 1
    fi
else
    echo "This must be run on mcs1!"
    exit 1
fi
