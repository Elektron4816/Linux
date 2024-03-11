#!/bin/bash

function zero {
    res=$1
    if [[ ${#1} -ne 2 ]]; then
        res="0$1"
    fi
    echo $res
}


mas_month=([1]="янв" "фев" "мар" "апр" "май" "июн" "июл" "авг" "сен" "окт" "ноя" "дек")

rand_month_num=$(($RANDOM % 12 + 1))
rand_month=${mas_month[$rand_month_num]}

rand_year=$(($RANDOM % 43 + 1980))
leap_year=$(($rand_year % 4))

if [[ $leap_year -eq 0 && $rand_month_num -eq 2 ]]; then
    max_day=29
elif [[ $rand_month_num -eq 2 && $leap_year -ne 0 ]]; then
    max_day=28
elif [[ $rand_month_num -eq 1 || $rand_month_num -eq 3 || $rand_month_num -eq 5 || $rand_month_num -eq 7 || $rand_month_num -eq 8 || $rand_month_num -eq 10 || $rand_month_num -eq 12 ]]; then
    max_day=31
else
    max_day=30
fi

rand_day=$(($RANDOM % $max_day + 1))

max_hour=23
rand_hour=$(($RANDOM % $max_hour + 1))
max_minute=60
rand_minute=$(($RANDOM % $max_minute + 1))
max_second=60
rand_second=$(($RANDOM % $max_second + 1))
