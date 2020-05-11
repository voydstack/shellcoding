bits 64
section .text
global _start

_start:
	jmp getstring

	hello:
	
	; write(1, "Hello, World !\n", 0x10)
	
	xor rax, rax
	inc rax
	mov rdi, rax
	pop rsi
	xor rdx, rdx
	mov dl, 0x10

	syscall

	; exit(0)
	
	mov al, 60
	dec rdi

	syscall 

	getstring:
		call hello
		db "Hello, World !", 0xa