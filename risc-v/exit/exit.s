.section .text
.global _start

_start:
	c.j getaddr
	
	main:
	# forge ecall instruction (0x000000e3)
	# *ecall ^= 0xffffffff
	c.li s0, -1
	lw s1, -0x8(ra)
	xor s1, s0, s1
	sw s1, -0x8(ra)

	# exit(0)
	li a0, 0
	li a7, (0x100 + 93) # SYS_exit + 0x100
	andi a7, a7, 0x2ff

	ecall:
		.byte 0x8c, 0xff, 0xff, 0xff
	getaddr:
		call main


