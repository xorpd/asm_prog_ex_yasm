; Basic Assembly
; ==============
; 
; Signed Operations
; -----------------
;
; Soulmate
; @@@@@@@@
; 
; 0.    Assemble and run this program.
; 
; 1.    What are the numbers found by the program? Try to guess.
;
; 2.    Read the code below, and try to understand the meaning of the numbers
;       returned by the program.
;
; 3.    Why does it take the program so long to complete? How many iterations
;       does the main loop goes through?
;

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:

    mov     ecx,0ffffffffh

iters:
    mov     eax,ecx
    neg     eax
    cmp     eax,ecx
    jnz     not_equal
    mov     eax,ecx
    call    print_eax
not_equal:
    dec     ecx
    cmp     ecx,0ffffffffh
    jnz     iters

    ; Exit the process:
	push	0
	call	exit
