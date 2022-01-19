bits 32
section .text
global _start

_start:
	; exit(0)
	
	xor ebx, ebx
	
	xor eax, eax
	inc eax

	int 0x80