# Linux aarch64 Shellcodes (ARM 64 bits)

Linux aarch64 shellcode collection without any nullbytes, spaces or newlines.

### **[exit(0) (12 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/exit)**

Simply exits.

### **[Hello, World (48 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/hello)**

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

### **[read second stage (32 bytes)](https://github.com/voydstack/shellcoding/tree/master/aarch64/read-stage)**

Reads a second-stage shellcode next to it (position independent)

## Assemble shellcodes

```sh
aarch64-linux-gnu-as shellcode.s -o shellcode.o && aarch64-linux-gnu-ld shellcode.o -N -o shellcode
aarch64-linux-gnu-objcopy -O binary shellcode shellcode.bin && rm shellcode.o shellcode
```

### Run shellcodes:

```sh
./executor [start offset] < shellcode.bin
```

## References:

- [https://modexp.wordpress.com/2018/10/30/arm64-assembly/](https://modexp.wordpress.com/2018/10/30/arm64-assembly/)
- [https://modexp.wordpress.com/2017/09/11/shellcode-linux-aarch64/](https://modexp.wordpress.com/2017/09/11/shellcode-linux-aarch64/)
- [https://thog.github.io/syscalls-table-aarch64/latest.html](https://thog.github.io/syscalls-table-aarch64/latest.html)
- [https://developer.arm.com/documentation/102374/latest/](https://developer.arm.com/documentation/102374/latest/)