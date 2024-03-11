#!/bin/bash

path=../04/log/*

if [ $# -ne 1 ]; then
    echo Enter only 1 argument, 1-4
elif [[ $1 -eq 1 ]]; then
    awk '{print $9,$0}' $path | sort >>log_sort_code.log
elif [[ $1 -eq 2 ]]; then
    awk '{print $1}' $path | sort -u >>unique_ip.log
elif [[ $1 -eq 3 ]]; then
    awk ' / 400 / || / 401 / || / 403 / || / 404 / || / 500 / || / 501 / || / 502 / || / 503 / {print $0}' $path >>error_log.log
elif [[ $1 -eq 4 ]]; then
    awk ' / 400 / || / 401 / || / 403 / || / 404 / || / 500 / || / 501 / || / 502 / || / 503 / {print $0}' $path >>err.log
    awk '{print $1}' ./err.log | sort -u >>ip_with_errors.log
    rm -rf err.log
else
    echo $1 - is wrong parametr, use 1-4 options
fi
