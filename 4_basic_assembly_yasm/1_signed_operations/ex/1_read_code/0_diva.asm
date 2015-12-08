; Basic Assembly
; ==============
; 
; Signed Operations
; -----------------
;
; Diva
; @@@@
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
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.
; 
; 5.    What happens if you try to give the program negative values? (Note that
;       you may just use the minus symbol, for example: -10.
;       Is the result correct? What happens if both of the of the arguments are
;       negative?
;
; 6.    Try to change the "cdq" instruction to "mov edx,0", and check what
;       results do you get now. Do you still get correct results for negative
;       numbers?
;       
; 7.    Implement the "cdq" instruction yourself, using an IF style
;       conditional (With CMP and the relevant JCC instruction). 
;       Make sure that you get the same results as in the original program.
;

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:

    call    read_hex
    mov     esi,eax
    call    read_hex
    mov     edi,eax

    mov     eax,esi
    cdq     
    idiv    edi

    call    print_eax
    

    ; Exit the process:
	push	0
	call	exit
