; Basic Assembly
; ==============
; 
; Memory - Structures
; -------------------
;
; Vector Adder
; @@@@@@@@@@@@
; 
; 0.    Assemble and run this program.
;
; 1.    How many inputs does this program require? 
;       Try to give the program some inputs, and check out the results. 
;
; 2.    Read the program's code below, and try to understand what does it do. 
;       Try to describe it as simply as you can. Add comments if needed.
;
; 3.    Explain: Why is the bss section being used in this program, and not the
;       data section?

BITS 32
global main
extern exit

%include "training.s"

; Point / Coordinate structure:
STRUC PNT
    .x:   dd  ?       ; X coordinate.
    .y:   dd  ?       ; Y coordinate.
ENDSTRUC

; ===============================================
section .bss
    v1: ISTRUC PNT
	AT PNT.x, 	DD 	0
	AT PNT.y,	DD	0
    IEND
    v2: ISTRUC PNT          ; Input Vector 2.
	AT PNT.x, 	DD 	4
	AT PNT.y,	DD	4
    IEND
	
    rvec: ISTRUC PNT     ; Result vector.
	AT PNT.x, 	DD 	8
	AT PNT.y,	DD	8
    IEND
    
; ===============================================
section .text

main:
    
    ; Read coordinates of the first vector:
    call    read_hex
    mov     dword [v1 + PNT.x],eax
    call    read_hex
    mov     dword [v1 + PNT.y],eax

    ; Read coordinates of the second vector:
    call    read_hex
    mov     dword [v2 + PNT.x],eax
    call    read_hex
    mov     dword [v2 + PNT.y],eax

    ; Add the two vectors:

    ; Copy first input vector:
    ; Note that we have to use an intermediate register, 
    ; as we can not directly mov memory to memory.
    mov     eax,dword [v1 + PNT.x]
    mov     dword [rvec + PNT.x],eax
    mov     eax,dword [v1 + PNT.y]
    mov     dword [rvec + PNT.y],eax

    ; Add second input vector:
    mov     eax,dword [v2 + PNT.x]
    add     dword [rvec + PNT.x],eax
    mov     eax,dword [v2 + PNT.y]
    add     dword [rvec + PNT.y],eax

    ; Print a delimiter: ("========")
    ; NOTE: This is a new subroutine. It can be found inside training.inc.
    call    print_delimiter

    ; Print the resulting vector:
    mov     eax, dword [rvec + PNT.x]
    call    print_eax
    mov     eax, dword [rvec + PNT.y]
    call    print_eax

    ; Exit the process:
	push	0
	call	exit

