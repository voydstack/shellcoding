.section .text
.global __start

__start:

	# exit(0)

	slti $a0, $zero, -1
	li $v0, 4001 # SYS_exit
	syscall 0x040405
