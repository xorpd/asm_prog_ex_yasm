; Becoming Independent
; equ===================
; 
; Debugging
; ---------
; 
; leetsp34k
; @@@@@@@@@
;
; 0     Read the main comment of this program.
;
; 1.    Assemble and run this program. Give the program an example input, and
;       observe the program's operation.
;
; 2.    Skim the code. Take a look at the functions and their descriptions.
;
; 3.    The code contains a few errors. Find those errors and fix them, so that
;       the program runs correctly. Use a debugger for this task. You may need
;       to add/remove/change a few instructions in this program.
;

; The program requests a string from the user, and transforms the string into
; leetspeek. Finally the resulting string is printed to the console.

BITS 32
global main
extern exit

%include "training.s"

MAX_USER_STRING equ 40h

; equ==============================================
section .data
    please_enter    db  'Please enter a string:',13,10,0

; equ==============================================
section .bss
    user_string     resb  MAX_USER_STRING

; equ==============================================
section .text

main:
    ; Ask for a string from the user:
    mov     esi,please_enter
    call    print_str

    ; Read a string:
    mov     ecx,MAX_USER_STRING
    mov     edi,user_string
    call    read_line

    ; Transform string into leetspeak:
    push    user_string
    call    transform_leet
    add     esp,4

    ; Print the resulting string to the console:
    mov     esi,user_string
    call    print_str

    ; Exit the process:
	push	0
	call	exit

; equ========================================
; transform_leet(str)
; 
; Operation: 
;   Transforms the string at location str in memory into a leetspeak
;   string. Note that the original string will be modified.
;
; Input:
;   str - A location of a string in memory.
;
; Output:
;   The string at location str is transformed into the corresponding leetspeak
;   string.
; 
transform_leet:
    .str equ 8
    push    ebp
    mov     ebp,esp

    mov     esi,dword [ebp + .str]

.next_char:
    mov     al,byte [esi]
    test    al,al
    jz      .found_null
    ; Not a null char:
    push    esi
    call    transform_leet_char
    inc     esi     ; Get next character.
    jmp     .next_char
.found_null:
    pop     ebp
    ret

; equ========================================
; transform_leet_char(char_addr)
; 
; Operation:
;   Transforms the character at location char_addr into a leet character.
;
; Input: 
;   char_addr   - Address of character in memory.
; 
; Output:
;   Character at location char_addr is transformed into a new character.
;   No output in eax register.
;
transform_leet_char:
    .char_addr equ 8
    push    ebp
    mov     ebp,esp

    mov     esi,dword [ebp + .char_addr]

    cmp     byte [esi],'e'
    jnz     f
    mov     byte [esi],'3'
    jmp     end_func
f:
    cmp     byte [esi],'a'
    jnz     @f_
    mov     byte [esi],'4'
    jmp     end_func
@f_:
    cmp     byte [esi],'l'
    jnz     @f__
    mov     byte [esi],'1'
    jmp     end_func
@f__:
    cmp     byte [esi],'o'
    jnz     @f___
    mov     byte [esi],'0'
    jmp     end_func
@f___:
    cmp     byte [esi],'t'
    jnz     end_func
    mov     byte [esi],'7'
end_func:
    pop     ebp
    ret

