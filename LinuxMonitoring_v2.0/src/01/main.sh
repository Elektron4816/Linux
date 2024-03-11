#!/bin/bash

path=$1
sum_folders=$2
name_folders=$3
sum_files=$4
name_files=${5%.*}
weight_files=$6 #${6:0:${#6}-2}
ext=${5##*.}

source check_input.sh

if [[ $succses -eq 1 ]]; then
    source get_func.sh
    get_folders $path $sum_folders $name_folders
fi
