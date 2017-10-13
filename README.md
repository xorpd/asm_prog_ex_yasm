Assembly Programming Exercises
==============================

A port of the assembly programming exercises of Assembly Language Adventures to
Yasm on Linux by [blankwall](https://github.com/blankwall/).

This repository contains exercises for the Assembly Programming course.
More information could be found at [www.xorpd.net](https://www.xorpd.net)

## Install Instructions

```
git clone https://github.com/xorpd/asm_prog_ex_yasm
cd asm_prog_ex
sudo ./run_install_ubuntu
./run_test
```

If all works hello world should be printed and you will have a directory called assembly with a basic program in it. :) !

## Assembling, Linking and running programs

Most likely that you have a x64 machine. However, this course is for running 32
bits programs. You will need some extra effort to assemble link and run 32 bits
programs on your machine.

`install.s` currently installs two required dependencies: `yasm` and
`gcc-multilib`. On ubuntu 16.04 this is done using the command:

    sudo apt install gcc-multilib yasm

If you are using another Linux distro make sure to install `yasm` and
`gcc-multilib`.

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

