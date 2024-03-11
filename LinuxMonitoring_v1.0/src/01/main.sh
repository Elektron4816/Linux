#!/bin/bash

regex='^[+-]?[0-9]+([.][0-9]+)?$'

if [ $# != 1 ]
then 
echo "Need input only one argument"
elif [[ $1 =~ $regex ]]
then
echo "Incorrect input"
else 
echo $1
fi