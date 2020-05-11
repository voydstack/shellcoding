bits 32
section .text
global _start

_start:
	; exit(0)
	xor eax, eax
	mov al, 0x1
	xor ebx, ebx
	
	int 0x80