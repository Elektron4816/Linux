#!/bin/bash

param=$1

if [ $# -ne 1 ]; then
    echo Enter only 1 argument, 1-3
elif [[ $param -eq 1 ]]; then
    source clear_log.sh
elif [[ $param -eq 2 ]]; then
    source clear_date_time.sh #не реализованно
elif [[ $param -eq 3 ]]; then
    source clear_mask_name.sh
else
    echo Wrong parametr, use 1-3 options
fi
