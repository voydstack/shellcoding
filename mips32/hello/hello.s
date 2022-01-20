.section .text
.global __start

__start:
	li $t0, 0x48656c6c # Hell
	li $t1, 0x6f2c576f # o,Wo
	li $t3, 0x726c6421 # rld!

	sw $t0, -0x10($sp)
	sw $t1, -0xc($sp)
	sw $t3, -0x8($sp)
	sb $zero, -0x4($sp)

	slti $a0, $zero, 0x1337
	la $a1, -0x10($sp)
	li $a2, 0x80c
	andi $a2, 0x2ff
	li $v0, 4004 # SYS_write
	syscall 0x040505

	# exit(0)

	slti $a0, $zero, -1
	li $v0, 4001 # SYS_exit
	syscall 0x040405
