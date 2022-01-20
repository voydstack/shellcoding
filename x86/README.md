# Linux x86 Shellcodes

Linux x86 shellcode collection without any nullbytes, spaces or newlines.

### **[exit(0) (7 bytes)](https://github.com/voydstack/shellcoding/tree/master/x86/exit)**

Simply exits.

### **[Hello,World! (33 bytes)](https://github.com/voydstack/shellcoding/tree/master/x86/hello)**

Displays "Hello,World!".

### **[/bin/sh (22 bytes)](https://github.com/voydstack/shellcoding/tree/master/x86/shell)**

Executes `execve("/bin/sh", NULL, NULL)`.

### **[setreuid /bin/sh (36 bytes)](https://github.com/voydstack/shellcoding/tree/master/x86/setreuid-shell)**

Executes `setreuid(1000, 1000); execve("/bin/sh", NULL, NULL)`.

### **[bindshell (101 bytes)](https://github.com/voydstack/shellcoding/tree/master/x86/bind-shell)**

Runs a bind-shell on port 4444.

### **[reverse shell (82 bytes)](https://github.com/voydstack/shellcoding/tree/master/x86/reverse-shell)**

Runs a reverse shell on 127.0.0.1:4444.

### **[read file (63 bytes)](https://github.com/voydstack/shellcoding/tree/master/x86/readfile)**

Reads a file (/etc/passwd in the shellcode).

### **[read second stage (22 bytes)](https://github.com/voydstack/shellcoding/tree/master/x86/read-stage)**

Reads a second stage shellcode next to it.

### Assemble shellcodes:

```sh
./assemble.sh # Assembles every shellcodes in this directory
# or 
nasm -f bin shellcode.asm -o shellcode.bin
```

### Run shellcodes:

```sh
./executor < shellcode.bin
```