#!/bin/bash

random_len=$(($RANDOM % 5 + 5))

user_name=$(cat /dev/urandom | tr -cd 'a-zA-Z' | head -c $rendom_len)
