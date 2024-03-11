#!/bin/bash

function get_files {
    name=$name_files
    for ((k = 0; k < $sum_files; k++)); do
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
        output_files=$name
        output_files+="_$(date +%d%m%y)"
        fallocate -l $weight_files $path_files/$output_files.$ext
        name+=${name: -1}
        output_files=$name
        echo -e "$output_files"_$(date +%d%m%y)".$ext $weight_files --------- $(date +%d_%m_%Y)" >>log.txt
    done
}

function get_folders {
    for ((i = 0; i < $sum_folders; i++)); do
        check_space=$(df -h / | grep / | awk '{print $4}' | grep -o '[0-9][,][0-9]')
        if [[ $check_space < "1,0" ]]; then
            echo No space left on device
            exit
        else
            if [[ ${#name_folders} -lt 4 ]]; then
                if [[ ${#name_folders} -lt 3 ]]; then
                    name=${name_folders::1}
                    name+=$name_folders
                    name_folders=$name
                fi
                name=${name_folders::1}
                name+=$name_folders
                name_folders=$name
            fi
            if [[ ${#output_folders} -gt 254 ]]; then
                echo Folder name too long
                exit
            fi
            output_folders=$name_folders
            output_folders+="_$(date +%d%m%y)"
            mkdir $path$output_folders
            path_files="$path$output_folders"
            echo -e "$path_files"/"--------- $(date +%d_%m_%Y)" >>log.txt
            get_files $path_files $sum_files $name_files $weight_files
            name_folders+=${name_folders: -1}
            output_folders=$name_folders
        fi
    done
}
