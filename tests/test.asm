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

