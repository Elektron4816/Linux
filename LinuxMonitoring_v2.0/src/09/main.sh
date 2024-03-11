#!/bin/bash

if [ -f /var/www/html/metrics/index.html ]; then
    sudo rm -rf /var/www/html/metrics/index.html
fi
while true; do
    CPU_percent=$(ps aux | awk '{print $3}' | awk '{sum_cpu += $1} END {print sum_cpu}')
    echo "# HELP cpu_used_in_percent" >>/var/www/html/metrics/index.html
    echo "# TYPE cpu_used_in_percent gauge" >>/var/www/html/metrics/index.html
    echo "cpu_used_in_percent $CPU_percent" >>/var/www/html/metrics/index.html

    echo "# HELP free_mem_in_Kbyte" >>/var/www/html/metrics/index.html
    echo "# TYPE free_mem_in_Kbyte gauge" >>/var/www/html/metrics/index.html

    FREE_mem=$(free -k | grep Mem | awk '{print $4}')

    echo "free_mem_in_Kbyte $FREE_mem" >>/var/www/html/metrics/index.html

    echo "# HELP free_space_in_Kbyte" >>/var/www/html/metrics/index.html
    echo "# TYPE free_space_in_Kbyte gauge" >>/var/www/html/metrics/index.html

    FREE_space=$(df -k / | grep dev | awk '{print $4}')
    echo "free_space_in_Kbyte $FREE_space" >>/var/www/html/metrics/index.html
    sleep 10
done
