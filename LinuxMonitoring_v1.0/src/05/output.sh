#!/bin/bash

echo -e "$blue_text \bTotal number of folders (including all nested ones)$reset_color = $total_folders"
echo -e "$blue_text \bTOP 5 folders of maximum size arranged in descending order (path and size):$reset_color\n$top_5_folders"
echo -e "$blue_text \bTotal number of files$reset_color = $total_files"
echo -e "$blue_text \bNumberd of:$reset_color\nConfiguration files (with the .conf extension) = $conf_files"
echo "Text files = $text_files"
echo "Executable files = $execut_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $symb_files"
echo -e "$blue_text \bTOP 10 files of maximum size arranged in descending order (path, size and type):$reset_color"
echo "$top_10_weight_files"
echo -e "$blue_text \bTOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):$reset_color"
paste -d ' ' <(echo "$top_10_exe_file") <(echo "$top_10_sha")
