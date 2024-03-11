#!/bin/bash

start_script=$(date +%s.%N)

dir=$1
red_text='\033[91m'
blue_text='\033[94m'
reset_color='\033[0m'

if [ $# != 1 ]
then
    echo -e "$red_text \bEnter directory path$reset_color"
elif [ ${dir: -1} != "/" ]
then
    echo -e "$red_text \bDirectory $dir does not exist$reset_color"
else
    source variable.sh
    source output.sh
fi
end_script=$(date +%s.%N)
out=$(echo "$end_script $start_script" | awk '{printf "%.2lf", $1-$2}')
echo "Script execution time (in seconds) = $out"
