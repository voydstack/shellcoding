.section .text
.global _start

_start:

	// exit(0)

	mov x0, xzr
	mov x8, 0x5D // SYS_exit
	svc #0x1337
