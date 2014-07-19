; Basic Assembly
; ==============
; 
; Strings
; -------
;
; Greeting
; @@@@@@@@
;
; 0.    Assemble and run this program.
;
; 1.    Try to give the program different inputs, and observe the output.
;
; 2.    Read the program's code below, and try to understand what does it do. 
;       Try to describe it as simply as you can. Add comments if needed.
;
; 3.    Explain the program's output.
;
BITS 32
global main
extern exit

%include "training.s"

MAX_NAME_LEN equ 10
GREETING_MAX equ HELLO_SIZE + MAX_NAME_LEN + HOW_ARE_SIZE + 1

; ===============================================
section .data
    please_enter    db  'Please enter your name:',13,10,0
    hello           db  'Hello ',0
    HELLO_SIZE  equ  $ - hello - 1
    how_are         db  ', how are you today?',13,10,0
    HOW_ARE_SIZE equ  $ - how_are - 1

; ===============================================
section .bss
    greeting        resb   GREETING_MAX 
    user_name       resb   MAX_NAME_LEN+1 

; ===============================================
section .text

main:
    ; Show a message to the user:
    mov     esi,please_enter
    call    print_str

    ; Read user's name:
    mov     ecx,MAX_NAME_LEN+1
    mov     edi,user_name
    call    read_line

    ; Now we build the greeting:
    mov     edi,greeting

    ; Copy the hello part into the greeting:
    mov     esi,hello
hello_copy_byte:
    lodsb
    test    al,al
    jz      copy_hello_done
    stosb
    jmp hello_copy_byte
copy_hello_done:

    ; Copy the name part into the greeting:
    mov     esi,user_name
name_copy_byte:
    lodsb
    test    al,al
    jz      copy_name_done
    stosb
    jmp name_copy_byte
copy_name_done:

    ; Copy the how are you part into the greeting:
    mov     esi,how_are
hay_copy_byte:
    lodsb
    test    al,al
    jz      copy_hay_done
    stosb
    jmp hay_copy_byte
copy_hay_done:
    
    ; Set null terminator for the gretting.
    xor     al,al
    stosb

    mov     esi,greeting
    call    print_str


    ; Exit the process:
    push    0
    call    exit

