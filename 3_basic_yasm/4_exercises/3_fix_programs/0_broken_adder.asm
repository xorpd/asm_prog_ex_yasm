; Basic fasm
; ==========
; 
; Fix Programs
; ------------
;
; Broken Adder
; @@@@@@@@@@@@
; 
; 0.    Try to assemble and find out the assembly error message.
;
; 1.    Fix the code to make the assembly process succeed.
;
; 2.    Run the program. Make sure that the program behaves correctly.
;

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:
    ; The program begins here:

    ; Read two numbers:
    call    read_hex    
    mov     esi,al
    call    read_hex

    ; Add the two numbers, to get their sum.
    add     eax,esi

    ; Output the sum:
    call    print_eax   

    ; Exit the process:
	push	0
	call	exit

