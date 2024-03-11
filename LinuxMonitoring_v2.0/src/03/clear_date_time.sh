#!/bin/bash

echo "Enter the date and time in the format: 2023-10-23 00:00"
read date

if [ -z "$date" ]
then
	echo "Date cannot be empty"
	exit 1
fi

find /home/ -type f -newermt "$date" -delete

find /home/ -type d -newermt "$date" -delete
