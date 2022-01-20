bits 64
section .text
global _start

_start:
	jmp getstring

	hello:
	
	; write(1, "Hello,World!", 0xc)
	
	push 0x1
	pop rax
	
	mov rdi, rax
	pop rsi

	push 0xc
	pop rdx

	syscall

	db 0xff ; Needed to crash and not fall in an infinite loop

	getstring:
		call hello
		db "Hello,World!"