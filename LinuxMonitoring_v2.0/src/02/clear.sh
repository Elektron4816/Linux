#!/bin/bash

date_folder=$(date +"%d%m%y")
find ~ -name "*$date_folder*" -delete
