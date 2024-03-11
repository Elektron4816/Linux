#!/bin/bash

if [ $# -ne 6 ]; then
    echo Not enough arguments, need 6
elif ! [ -e $path ]; then
    echo "$path - No such file or directory"
elif [[ ${#name_folders} -gt 7 ]]; then
    echo "$name_folders - Too long folders name, must be <= 7"
elif [[ $name_folders =~ [^A-Za-z] ]]; then
    echo $name_folders Wrong folder name, use A-z symbol
elif [[ ${#name_files} -gt 7 || ${#name_files} -lt 1 ]]; then
    echo "$name_files - Files name, must be 0 < and < 8"
elif [[ $name_files =~ [^A-Za-z] ]]; then
    echo $name_files Wrong file name, use A-z symbol
elif [[ ${#ext} -gt 3 || ${#ext} -lt 1 ]]; then
    echo "$ext - Extension of file, must be 0 < and < 4"
elif [[ $ext =~ [^A-Za-z] ]]; then
    echo $ext - Wrong extension, use A-z symbol
elif ! [[ ${6: -2} = "kb" ]]; then
    echo Wrong unit, use only kb
elif [[ ${6:0:${#6}-2} -gt 100 ]]; then
    echo "${6:0:${#6}-2} - To high weight of file"
else
    succses=1
fi
