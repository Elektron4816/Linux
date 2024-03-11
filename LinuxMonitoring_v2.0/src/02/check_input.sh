#!/bin/bash

if [ $# -ne 3 ]; then
    echo Not enough arguments, need 3
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
elif ! [[ ${3: -2} = "Mb" ]]; then
    echo Wrong unit, use only Mb
elif [[ ${3:0:${#3}-2} -gt 100 ]]; then
    echo "${3:0:${#3}-2} - To high weight of file"
else
    succses=1
fi
