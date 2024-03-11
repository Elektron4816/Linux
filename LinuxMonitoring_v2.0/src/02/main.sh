#!/bin/bash

start_script_in_second=$(date +%s)
start_script=$(date +%H:%M:%S)
echo "Start time $start_script" >>log.txt

path=/home/
name_folders=$1
name_files=${2%.*}
weight_files=$3
ext=${2##*.}

source check_input.sh

if [[ $succses -eq 1 ]]; then
    source get_func.sh
    get_folders $path $sum_folders $name_folders
fi

end_script_in_second=$(date +%s)
end_script=$(date +%H:%M:%S)
echo "End time $end_script" >>log.txt

out=$(echo "$end_script_in_second $start_script_in_second" | awk '{printf "%d", $1-$2}')
echo "Working time $out Sec." >>log.txt
echo Start time $start_script
echo End time $end_script
echo Working time $out Sec.
