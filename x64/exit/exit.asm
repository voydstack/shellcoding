bits 64
section .text
global _start

_start:
	; exit(0)

	xor rdi, rdi

	push 0x3c
	pop rax ; SYS_exit
	
	syscall