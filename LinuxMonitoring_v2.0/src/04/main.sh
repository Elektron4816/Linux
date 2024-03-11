#!/bin/bash

mkdir ./log

for ((k = 0; k < 5; k++)); do
    source gen_log.sh
done
