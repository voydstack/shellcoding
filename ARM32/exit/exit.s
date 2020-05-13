.section .text
.global _start

_start:

	.code 32

	// Switching to THUMB mode
	add r3, pc, #1
	bx r3

	.code 16

	// exit(0)
	mov r7, #1
	eor r0, r0
	swi #1
	