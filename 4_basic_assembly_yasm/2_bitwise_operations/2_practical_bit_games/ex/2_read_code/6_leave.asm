; Basic Assembly
; ==============
; 
; Bitwise operations - Practical bit games
; ----------------------------------------
;
; Leave
; @@@@@
;
; 0.    Assemble and run this program.
; 
; 1.    How many inputs does this program expect?
;
; 2.    Try to give different inputs to this program, and check the results.
;       Particularly, try the following input pair: (ffffffff,00000000).
;
; 3.    Read the program's code below, and try to understand what does it do. 
;       Try to describe it as simply as you can. Add comments if needed.
;       
; 4.    Pick some random inputs and verify your predictions about what this
;       program does.
;

BITS 32

%include	'training.s' 

global main
extern	exit 	

; ===============================================
section .text

main:
    call    read_hex
    mov     edx,eax
    call    read_hex
    mov     esi,eax

    mov     eax,edx
    call    print_eax_binary
    mov     eax,esi
    call    print_eax_binary

    ; Note that we only use the lower part of edx and esi.
    ; The upper part is ignored.

    mov     ecx,16

two_bits_iter:
    rol     dx,1
    movzx   edi,dx
    and     edi,1
    shl     eax,1
    or      eax,edi

    rol     si,1
    movzx   edi,si
    and     edi,1
    shl     eax,1
    or      eax,edi

    loop    two_bits_iter

    call    print_eax_binary

    ; Exit the process:
	push	0
	call	exit
