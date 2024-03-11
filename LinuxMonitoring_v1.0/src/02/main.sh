#!/bin/bash

source variable.sh
source output.sh

echo Do you want save information? "(Y/N)"
read answer

if [[ $answer = 'Y' || $answer = 'y' ]]
then
filename=$(date +"%d_%m_%y_%k_%M_%S")
source output.sh > $filename.status
fi