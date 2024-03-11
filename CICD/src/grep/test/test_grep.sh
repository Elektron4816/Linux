#!/bin/bash

SUCCESS=0
FAIL=0
COUNTER=0
TEST_FILE_1="./test/a.txt ./test/b.txt"
TEST_FILE_2="./test/a.txt"
LOGER="./test/grep_log.txt"

FLAGS="-i -v -c -l -n -h -s -iv -ic -il -in -ih -is -vc -vl -vn -vh -vs -cn -ch -cs -ln -lh -ls -nh -ns -hs -ivc -ivl -ivn -ivh -ivs -vcn -vch -vcs -lnh -lns -ol -oh" 

cd src/grep

for var in $FLAGS
do
    TEST="$TEST_FILE_1"
    ./s21_grep $var hello $TEST > ./test/21_grep.txt
    grep $var hello $TEST > ./test/grep.txt
    if cmp -s ./test/21_grep.txt ./test/grep.txt; then
        ((SUCCESS++))
    else
        echo "TEST_FILE_1"$var >> $LOGER
        ((FAIL++))
    fi
     rm ./test/21_grep.txt ./test/grep.txt
done


for var in $FLAGS
do
    TEST="$TEST_FILE_2"
    ./s21_grep $var hello $TEST > ./test/21_grep.txt
    grep $var hello $TEST > ./test/grep.txt
    if cmp -s ./test/21_grep.txt ./test/grep.txt; then
        ((SUCCESS++))
    else
        echo "TEST_FILE_2"$var >> $LOGER
        ((FAIL++))
    fi
     rm ./test/21_grep.txt ./test/grep.txt
done

echo SUCCESS: $SUCCESS
echo FAIL: $FAIL

if [[ $FAIL -eq 0 ]]; then
        exit 0
else
        exit 1
fi