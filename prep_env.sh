#!/usr/bin/env bash

# Abort on failure
set -e

WORKING_DIR=$(pwd)
YASM=$(which yasm)
GCC=$(which gcc)
APT=$(which apt)

# Basic check to validate this as a debian system
if [[ $? == 0 ]];
then
    echo "Debian system"
    echo "Updating cache then promting for installion of yasm & gcc-multilib for 32-bit support"
    $APT update -y && $APT install gcc-multilib yasm
fi

echo "[*] Creating test build directory"
mkdir -vp build

echo "[*] Creating test asm file"
cat <<EOF > $WORKING_DIR/build/test.asm
; This program is a basic 32 bit hello world Yasm program.
; It displays hello world message to the user and quits.

BITS 32
global main
extern exit

%include "training.s"

; ===============================================
section .data
hello_world    db  'Hello World!',13,10,0

; ===============================================

section .text

main:
; Print a message to the user:
mov     esi, hello_world
call    print_str

; Exit the process:
push    0
call    exit
EOF

# create a file to sourced into the environment via '. env.src'

echo "[*] Creating environment source file"
cat <<EOF > env.src
# A funcation that compiles a asm file into the build direcotry
# Provide the asm file via cli arguments
function asm_compile (

    if [ ! -d "build" ]; then
       mkdir -pv \$(pwd)/build
    fi

    ASM_FILE=\$(echo \$1 | cut -d. -f1)
    $YASM -felf -I $WORKING_DIR/include -o \$(pwd)/build/\$ASM_FILE.o \$(pwd)/\$ASM_FILE.asm
    $GCC \$(pwd)/build/\$ASM_FILE.o -o \$(pwd)/build/\$ASM_FILE -m32

)

# Remove the build directory which should have the
# compile artifacts including objects file
alias asm_clean='rm -rf \$(pwd)/build'
EOF

