bits 64
section .text
global _start

_start:
	; exit(0)
	xor rax, rax
	mov al, 0x3c
	xor rdi, rdi
	
	syscall