#!/bin/bash

function get_files {
    name=$name_files
    random_sum_files=$(($RANDOM % 99 + 1))
    for ((k = 0; k < $random_sum_files; k++)); do
        if [[ ${#name} -lt 4 ]]; then
            if [[ ${#name} -lt 3 ]]; then
                file=${name::1}
                file+=$name
                name=$file
            fi
            file=${name::1}
            file+=$name
            name=$file
        fi
        if [[ ${#output_files} -gt 254 ]]; then
            echo File name too long
            exit
        fi
        output_files=$name${name: -1}
        output_files+="_$(date +%d%m%y)"
        fallocate -l $weight_files $path_files/$output_files.$ext
        name+=${name: -1}
        output_files=$name
        echo -e "$output_files"_$(date +%d%m%y)".$ext $weight_files --------- $(date +%d_%m_%Y)" >>log.txt
    done
}

function get_folders {
    for directory in $(find $path -type d); do
        random_sum_folders=$(($RANDOM % 99 + 1))
        folder=$name_folders
        if ! [[ $directory =~ \N*bin\N* ]]; then
            for ((i = 0; i < $random_sum_folders; i++)); do
                check_space=$(df -h / | grep / | awk '{print $4}' | grep -o '[0-9][,][0-9]')
                if [[ $check_space < "1,0" ]]; then
                    echo No space left on device
                    exit
                else
                    if [[ ${#folder} -lt 4 ]]; then
                        if [[ ${#folder} -lt 3 ]]; then
                            name=${folder::1}
                            name+=$folder
                            folder=$name
                        fi
                        name=${folder::1}
                        name+=$folder
                        folder=$name
                    fi
                    if [[ ${#output_folders} -gt 254 ]]; then
                        echo Folder name too long
                        exit
                    fi
                    output_folders=$folder${folder: -1}
                    output_folders+="_$(date +%d%m%y)"
                    mkdir $directory/$output_folders
                    path_files="$directory/$output_folders"
                    if [ -e $path_files ]; then
                        echo -e "$path_files"/ "--------- $(date +%d_%m_%Y)" >>log.txt
                        get_files $path_files $sum_files $name_files $weight_files
                    fi
                    folder+=${folder: -1}
                    output_folders=$folder
                fi
            done
        fi
    done
}
