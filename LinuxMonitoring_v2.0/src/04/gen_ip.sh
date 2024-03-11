#!/bin/bash

ip_first=$(($RANDOM % 192))
ip_second=$(($RANDOM % 255))
ip_third=$(($RANDOM % 255))
ip_fourth=$(($RANDOM % 255))

ip_out="$ip_first.$ip_second.$ip_third.$ip_fourth"
