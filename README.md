Assembly Programming Exercises
==============================

Forked from xorpd's assembly course. Porting the fasm assembly code for Windows to yasm code for Linux. Work in progress at the moment.

The course is roughly 90% ported and should be useable by all. The structure section is still under development but all others are done!

This repository contains exercises for the Assembly Programming course.
More information could be found at http://www.xorpd.net


## Install Instructions

Download yasm from here Yasm[http://yasm.tortall.net/Download.html]

Install on Linux by running, ./configure; make; make install

To compile a program copy the training.s file into your build directory and run yasm -f elf CODE.asm; gcc CODE.o 
