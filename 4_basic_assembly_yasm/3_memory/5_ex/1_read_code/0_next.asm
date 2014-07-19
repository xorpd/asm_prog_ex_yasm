; Basic Assembly
; ==============
; 
; Memory
; ------
;
; Next
; @@@@
; 
; 0.    Assemble and run this program.
;
; 1.    Read the program's code below, and try to understand what does it do. 
;       Try to describe it as simply as you can. Add comments if needed.
;
; 2.    Explain the program's output.
;

BITS 32
global main
extern exit

%include "training.s"
; This is the data section:
; ===============================================
section .data
    x_num   dd  11223344h

    
; ===============================================
section .text

main:

    call    read_hex
    xor     eax,eax
    inc     byte [x_num] ; Increase the first byte.
    mov     eax, dword [x_num]
    call    print_eax 

    ; Exit the process:
	push	0
	call	exit


