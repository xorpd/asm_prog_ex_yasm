; Basic Assembly
; ==============
; 
; Memory
; ------
;
; Ars Poetic
; @@@@@@@@@@
; 
; 0.    Assemble and run this program.
;
; 1.    Read the program's code below, and try to understand what does it do. 
;       Try to describe it as simply as you can. Add comments if needed.
;
; 2.    Explain the program's output.
;
; 3.    Open the executable in a hex editor, and try to find the output inside
;       the hex data.
;
; 4.    How can you change the program so that it will also apply to the code
;       inside training.s ?
;

BITS 32
global main
extern exit

%include "training.s"
; ===============================================
section .text

start:

    mov     esi,start
print_byte:
    movzx   eax, byte [esi]
    call    print_eax
    inc     esi
    cmp     esi,end_prog
    jnz     print_byte

    ; Exit the process:
	push	0
	call	exit

; A label that marks the end of our code.
end_prog:

