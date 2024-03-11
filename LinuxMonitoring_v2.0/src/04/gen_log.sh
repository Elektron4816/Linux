#!/bin/bash

source gen_date.sh

day=$(zero $rand_day)
hour=$rand_hour
minute=$rand_minute
second=$rand_second
uts=$(date +%z)

name_file=$day.$(zero $rand_month_num).$rand_year
number_of_records=$(($RANDOM % 1000 + 100))
for ((i = 0; i < $number_of_records; i++)); do
    source gen_ip.sh
    source gen_method.sh
    source gen_code_and_byte.sh
    source gen_agent.sh
    source gen_user.sh
    hour_out=$(zero $hour)
    minute_out=$(zero $minute)
    second_out=$(zero $second)
    echo "$ip_out - $user_name [$day/$rand_month/$rand_year:$hour_out:$minute_out:$second_out $uts] \"$rand_method $rand_path $rand_protocol\" $rand_code $rand_byte - \"$rand_agent\"" >>./log/$name_file.log
    second=$(($RANDOM % 59 + $second))
    if [[ $second -ge $max_second ]]; then
        ((minute++))
        second=0
    fi
    if [[ $minute -ge $max_minute ]]; then
        ((hour++))
        minute=0
    fi
    if [[ $hour -ge $max_hour ]]; then
        hour=0
    fi
done
