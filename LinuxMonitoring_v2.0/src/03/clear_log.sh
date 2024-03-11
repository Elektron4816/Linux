#!/bin/bash

echo Enter path from log file
read path
if [ -e $path ]; then
    directory=$(cat $path | grep / | awk '{print $1}')
    for rm_dir in $directory; do
        rm -rf $rm_dir
    done
else
    echo $path - directory not found
fi
