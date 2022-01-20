# Shellcodes Linux ARMv7 (32 bits)

Linux ARMv7 shellcode collection without any nullbytes, spaces or newlines.

### **[exit(0) (16 bytes)](https://github.com/voydstack/shellcoding/tree/master/ARM32/exit)**

Simply exits.

### **[Hello, World (36 bytes)](https://github.com/voydstack/shellcoding/tree/master/ARM32/hello)**

Displays "Hello,World!".

### **[/bin/sh (28 bytes)](https://github.com/voydstack/shellcoding/tree/master/ARM32/shell)**

Executes `execve("/bin/sh", NULL, NULL)`.

### **[setreuid /bin/sh (40 bytes)](https://github.com/voydstack/shellcoding/tree/master/ARM32/setreuid-shell)**

Executes `setreuid(1000, 1000); execve("/bin/sh", NULL, NULL)`.

### **[bindshell (92 bytes)](https://github.com/voydstack/shellcoding/tree/master/ARM32/bind-shell)**

Runs a bind-shell on port 4444.

### **[reverse shell (72 bytes)](https://github.com/voydstack/shellcoding/tree/master/ARM32/reverse-shell)**

Runs a reverse shell on 127.0.0.1:4444.

### **[read /etc/passwd (56 bytes)](https://github.com/voydstack/shellcoding/tree/master/ARM32/readfile)**

Reads a file (/etc/passwd in the shellcode).

### **[read second stage (20 bytes)](https://github.com/voydstack/shellcoding/tree/master/ARM32/read-stage)**

Reads a second stage shellcode next to it.



### Assemble shellcodes

```
arm-linux-gnueabihf-gcc shellcode.s -c && arm-linux-gnueabihf-ld shellcode.o -o shellcode
arm-linux-gnueabihf-objcopy -O binary shellcode shellcode.bin && rm shellcode.o shellcode
```

### Run shellcodes

```
qemu-arm -L /usr/lib/arm-linux-gnueabihf/ ./executor < shellcode.bin
```

### References

- [https://azeria-labs.com/writing-arm-shellcode/](https://azeria-labs.com/writing-arm-shellcode/)
- https://www.ic.unicamp.br/~ranido/mc404/docs/ARMv7-cheat-sheet.pdf