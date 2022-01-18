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
        addi a1, ra, -0x14

		# write(1, "Hello,World!", 12)
		li a0, 1
		li a2, 0xc

		li a7, 0x10
		slli a7, a7, 0x2 # 0x10 << 2 = 0x40 = SYS_write
		c.j ecall

	str:
		.ascii "Hello,World!"
	ecall:
		.byte 0x8c, 0xff, 0xff, 0xff
	getaddr:
		call main
