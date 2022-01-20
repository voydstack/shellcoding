# Linux MIPS Shellcodes - (32 bits, big endian)

Linux MIPS shellcode collection without any nullbytes, spaces or newlines.

### **[exit(0) (12 bytes)](https://github.com/voydstack/shellcoding/tree/master/mips32/exit)**

Simply exits.

### **[Hello, World (76 bytes)](https://github.com/voydstack/shellcoding/tree/master/mips32/hello)**

Displays "Hello World!\n" then exits.

### **[/bin/sh (48 bytes)](https://github.com/voydstack/shellcoding/tree/master/mips32/shell)**

Executes a shell (/bin/sh).

### **[setreuid /bin/sh (64 bytes)](https://github.com/voydstack/shellcoding/tree/master/mips32/setreuid-shell)**

Executes a shell with setreuid privilege.

### **[bindshell (192 bytes)](https://github.com/voydstack/shellcoding/tree/master/mips32/bind-shell)**

Classic bind shell.

### **[reverse shell (152 bytes)](https://github.com/voydstack/shellcoding/tree/master/mips32/reverse-shell)**

Classic reverse shell.

### **[read /etc/passwd (116 bytes)](https://github.com/voydstack/shellcoding/tree/master/mips32/readfile)**

Reads file and displays its output to stdout.

## Assemble shellcodes

```sh
mips-linux-gnu-as shellcode.s -o shellcode.o && mips-linux-gnu-ld shellcode.o -o shellcode
mips-linux-gnu-objcopy -O binary shellcode shellcode.bin && rm shellcode.o shellcode
# or
./assemble.sh
```

### Run shellcodes:

```sh
./executor [start offset] < shellcode.bin
```

## References:

- [https://s3-eu-west-1.amazonaws.com/downloads-mips/documents/MD00565-2B-MIPS32-QRC-01.01.pdf](https://s3-eu-west-1.amazonaws.com/downloads-mips/documents/MD00565-2B-MIPS32-QRC-01.01.pdf)
- [https://uweb.engr.arizona.edu/~ece369/Resources/spim/MIPSReference.pdf](https://uweb.engr.arizona.edu/~ece369/Resources/spim/MIPSReference.pdf)
- [https://fireshellsecurity.team/writing-a-shellcode-for-mips32/](https://fireshellsecurity.team/writing-a-shellcode-for-mips32/)