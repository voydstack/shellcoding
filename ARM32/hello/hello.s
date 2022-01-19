.section .text
.global _start

_start:
	.code 32

	// Switching to THUMB mode
	add r3, pc, #1
	bx r3

	.code 16

	// write(1, &hello, 0xc)
	
	eor r0, r0, r0
	adr r1, hello
	strb r0, [r1, #0xc]
	add r0, #1
	mov r2, #0xc
	mov r7, #4 // SYS_write
	swi #1

	nop // Required for alignement
hello:
	.ascii "Hello,World!"
