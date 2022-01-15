# Linux Shellcodes - aarch64 (ARM 64 bits)

Here is a aarch64 nullbyte-free shellcode collection.

### **[exit(0) (12 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/exit)**

Simply exits.

### **[Hello, World (56 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/hello)**

Displays "Hello World!\n" then exits.

### **[/bin/sh (40 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/shell)**

Executes a shell (/bin/sh).

### **[setreuid /bin/sh (56 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/setreuid-shell)**

Executes a shell with setreuid privilege.

### **[bindshell (168 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/bind-shell)**

Classic bind shell.

### **[reverse shell (140 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/reverse-shell)**

Classic reverse shell.

### **[read /etc/passwd (112 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/readfile)**

Reads file and displays its output to stdout.

## Assemble shellcodes

```sh
aarch64-linux-gnu-as shellcode.s -o shellcode.o && aarch64-linux-gnu-ld shellcode.o -N -o shellcode
aarch64-linux-gnu-objcopy -O binary shellcode shellcode.bin && rm shellcode.o shellcode
```

Run shellcodes:

```sh
./executor [start offset] < shellcode.bin
```