.section .text
.global _start

hello:
	.ascii "Hello,World!"
main:
	// write(1, "Hello,World!\n", 12)
	eor x0, xzr, #1
	adr x1, hello
	mov x2, 0xc

	mov x8, #0x40 // SYS_write
	svc #0x1337

	// exit(X)
	mov x8, 0x5D // SYS_exit
	svc #0x1337

// JUMP HERE (offset: 0x20 = 32)
_start:
	adr x10, main
	br x10

