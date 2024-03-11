#!/bin/bash

mas_method=([1]="GET" "POST" "PATCH" "PUT" "DELETE")

rand_method_num=$(($RANDOM % 5 + 1))
rand_method=${mas_method[$rand_method_num]}


mas_path=([1]="/test.txt" "/log" "/apache_pb.gif" "/profile" "/timedate" "/import" "/export" "/enter" "/show_list.txt" "/calendar")
rand_path_num=$(($RANDOM % 10 + 1))
rand_path=${mas_path[$rand_path_num]}


mas_protocol=([1]="HTTP/1.0" "HTTP/1.1")
rand_protocol_num=$(($RANDOM % 2 + 1))
rand_protocol=${mas_protocol[$rand_protocol_num]}
