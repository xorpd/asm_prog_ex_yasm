; Basic fasm
; ==========
; 
; Fix Programs
; ------------
;
; Magic numbej
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

    call    read_hex    ; Read input.
    add     eax,100j    ; Add 100 hex to the input.

    ; Output the result:
    call    print_eax   

    ; Exit the process:
	push	0
	call 	exit
