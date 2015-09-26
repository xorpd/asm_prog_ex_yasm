Assembly Programming Exercises
==============================

A port of the assembly programming exercises of Assembly Language Adventures to
Yasm on Linux by [blankwall](https://github.com/blankwall/).

This repository contains exercises for the Assembly Programming course.
More information could be found at http://www.xorpd.net

## Install Instructions

```
git clone https://github.com/blankwall/asm_prog_ex.git
cd asm_prog_ex
./install.s
./test.s
```

If all works hello world should be printed and you will have a directory called assembly with a basic program in it. :) !

## Assembling, Linking and running programs

Most likely that you have a x64 machine. However, this course is for running 32
bits programs. You will need some extra effort to assemble link and run 32 bits
programs on your machine.

You will need the gcc-multilib package. On my Ubuntu 14.04 I ran:

    sudo apt-get install gcc-4.8-multilib

to get it. Your linux might have a different version.

To assemble a program using Yasm, run:

    yasm -felf myprogram.asm

This will create a "myprogram.o" file on your system.
Next, we need to link the object file, to get a runnable executable file. We
can use gcc to do it:

    gcc myprogram.o -o myprogram -m32

The "-m32" flag means that our program is a 32 bits program.
Now you should get a file "myprogram". You can run it by typing on your
terminal window:

    ./myprogram




