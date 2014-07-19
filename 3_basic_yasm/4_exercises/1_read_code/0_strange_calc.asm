; Basic Nasm
; ==========
; 
; Read Code
; ---------
;
; Strange Calc
; @@@@@@@@@@@@
; 
; 0.    Assemble and run this program.
; 
; 1.    How many inputs does this program expect?
;
; 2.    Try to give different inputs to this program, and check the results.
;
; 3.    Read the program's code below, and try to understand what does it do. Try
;       to describe it as simply as you can.
;       
;       Note that the relevant part of the code is from the "start" label until
;       the [ExitProcess] call invocation. You do not need to read the input and
;       output subroutines.
;       
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:
    ; The program begins here:

    call    read_hex    
    mov     edx,eax
    call    read_hex    
    add     eax,edx
    add     eax,eax
    inc     eax         

    call    print_eax   

    ; Exit the process:
	push	0
	call	exit


