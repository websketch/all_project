#!/bin/bash

function init_udb_data_func()
{
    mysql -u$1 -p$2 -h$3  $4 <udb_init_data.sql
}

# MAIN
user=wangxinlin
password=123456
host=127.0.0.1
udbname=udb
date;
case "$1" in
    udb_init_data)
        init_udb_data_func ${user} ${password} ${host} ${udbname}
        ;;
    *)
        echo "Usage:
        udb-data.sh [udb_init_data]"
	;;
esac
date;
