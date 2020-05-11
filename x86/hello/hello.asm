bits 32
section .text
global _start

_start:
	jmp getstring

	hello:
	
	; write(1, "Hello, World !\n", 0x10)
	
	xor eax, eax
	xor ebx, ebx
	xor edx, edx
	mov al, 4
	inc ebx
	pop ecx
	mov dl, 0x10

	int 0x80

	; exit(0)
	
	mov al, 1
	dec ebx

	int 0x80

	getstring:
		call hello
		db "Hello, World !", 0xa