#!/bin/bash


gcc server.c -lfcgi
spawn-fcgi -p 8080 ./a.out
service nginx start

while true; do
/bin/bash
done

