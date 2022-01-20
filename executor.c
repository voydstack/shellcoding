#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <string.h>
#include <unistd.h>

#define SHELLCODE_SIZE 0x1000

int main(int argc, char *argv[]) {
	void (*shellcode)();

	shellcode = mmap(NULL, SHELLCODE_SIZE, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANON, -1, 0);

	if(shellcode == MAP_FAILED) {
		perror("[-] mmap");
		exit(1);
	}
	
	read(0, shellcode, SHELLCODE_SIZE);

	if(argc == 2) {
		shellcode += atoi(argv[1]);
	}
	
	shellcode();

	return 0;
}
