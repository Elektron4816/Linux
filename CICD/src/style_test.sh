#!/bin/bash

cd src/cat/
clang-format -n *.c *.h
clang-format -i *.c *.h
git diff --exit-code

cd ../grep
clang-format -n *.c *.h
clang-format -i *.c *.h
git diff --exit-code
