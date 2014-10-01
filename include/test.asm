; Basic Assembly
; ==============
; 
; Strings
; -------
BITS 32
global main
extern exit

%include "training.s"

MAX_NAME_LEN equ 10

; ===============================================
section .data
    please_enter    db  'Hello World!',12,10,0


; ===============================================

section .text

main:
    ; Show a message to the user:
    mov     esi,please_enter
    call    print_str


    ; Exit the process:
    push    0
    call    exit

