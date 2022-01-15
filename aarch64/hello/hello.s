.section .text
.global _start

hello:
	.ascii "Hello, World !\n"
	.byte 0x0f // size
main:
	// write(1, "Hello, World !\n", 15)
	eor x0, xzr, #1
	adr x1, hello
	ldrb w2, [x10, #-1]

	mov x8, #0x40 // SYS_write
	svc #0x1337

	// exit(0)
	eor x0, xzr, xzr
	mov x8, #0x5d // SYS_exit
	svc #0x1337

// JUMP HERE (offset: 0x30 = 48)
_start:
	adr x10, main
	br x10

