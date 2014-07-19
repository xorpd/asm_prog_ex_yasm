BITS 32
extern printf
extern exit
extern scanf
extern read

section .data 

hex_new  db 	"%x", 10, 0
hex_  	 db	"%x", 0
str_	 db	"%s", 0
new_	 db	"", 10, 0
delim 	db	"========",10,0

section .text

print_eax:
	pushad
	push	eax
	push 	hex_new
	call 	printf
	add	esp, 8
	popad
	ret

print_delimiter:
	pushad
	mov	eax, delim
	push	eax
	call 	printf
	add	esp,4
	popad
	ret

read_line:
	pushad
	push	ecx	
	push 	edi	
	push 	0
	call	read
	add	esp, 12
	xor	edx, edx
	mov	byte [edi+eax], 0
	popad
	ret

read_hex:
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	lea	ebx, [ebp-4]
	pusha
	push	ebx
	push 	hex_
	call 	scanf
	add	esp, 8
	popa
	mov	eax, [ebx]
	leave
	ret

print_str:
	pushad
    	push    esi
	call    printf
	add	esp, 4
	popad
	ret

print_eax_binary:
	pushad
	mov ecx,32 ; We print 32 digits.

.print_digit:
	    rol eax,1
	    mov edx,eax
	    and edx,1

	    push ecx ; Keep ecx and eax.
	    push eax

	    ; Print one digit:
	    push edx ; Digit to be printed.
	    push hex_ 
	    call printf
	    add esp,8

	    pop eax ; Restore eax and ecx.
	    pop ecx

	    loop .print_digit
	push new_
	call printf
	add	esp,4
	popad
	ret


