bits 32
section .text
global _start

_start:
	jmp getstring

	hello:
	
	; write(1, "Hello,World!", 0xc)
	
	xor ebx, ebx
	inc ebx

	pop ecx
	
	xor edx, edx
	mov dl, 0xc

	push 4
	pop eax ; SYS_write

	int 0x80

	db 0xff ; Invalid instruction to not loop

	getstring:
		call hello
		db "Hello,World!"