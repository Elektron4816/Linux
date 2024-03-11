#!/bin/bash

check=[1-6]
if [ $# != 4 ]
then
echo 'Enter 4 parameters (1-6)'
elif [[ $1 != $check || $2 != $check || $3 != $check || $4 != $check ]]
then
echo 'Wrong parameters, use (1-6)'
elif [[ $1 = $2 || $3 = $4 ]]
then
echo 'Text and background colors cannot mach'
else
source color.sh
source variable.sh
source output.sh

fi
