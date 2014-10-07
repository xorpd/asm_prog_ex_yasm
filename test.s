#! /bin/bash

cd ..
cd assembly
yasm -felf test.asm 
gcc test.o -o test -m32
./test
