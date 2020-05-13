.section .text
.global _start

_start:
	.code 32

	// Switching to THUMB mode
	add r3, pc, #1
	bx r3

	.code 16

	// write(stdout, hello, 16)
	
	mov r0, #1
	adr r1, hello
	sub r2, r2, r2
	strb r2, [r1, #0xf]
	mov r2, #0x10
	mov r7, #4
	swi #1

	// exit(0)
	eor r0, r0
	mov r7, #1
	swi #1

hello:
	.ascii "Hello, World !\n"
