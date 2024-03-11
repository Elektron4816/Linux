#!/bin/bash

user="verlinej"
host="192.168.56.9"
directory="/usr/local/bin/"
pass="4816"

scp -r src/cat src/grep $user@$host:/home/verlinej/
ssh $user@$host "echo $pass | sudo -S mv /home/verlinej/cat /home/verlinej/grep $directory"