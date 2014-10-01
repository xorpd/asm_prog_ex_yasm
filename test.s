#! /bin/bash

cd ..
cd assembly
nasm -felf test.asm 
gcc test.o -o test -m32
./test
