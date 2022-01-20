# Shellcodes Linux x64

x64 shellcode collection without any nullbytes, spaces or newlines.

### **[exit(0) (8 bytes)](https://github.com/voydstack/shellcoding/tree/master/x64/exit)**

Simply exits.

### **[Hello,World! (32 bytes)](https://github.com/voydstack/shellcoding/tree/master/x64/hello)**

Displays "Hello,World!".

### **[/bin/sh (25 bytes)](https://github.com/voydstack/shellcoding/tree/master/x64/shell)**

Executes `execve("/bin/sh", NULL, NULL)`.

### **[setreuid /bin/sh (38 bytes)](https://github.com/voydstack/shellcoding/tree/master/x64/setreuid-shell)**

Executes `setreuid(1000, 1000); execve("/bin/sh", NULL, NULL)`.

### **[bindshell (93 bytes)](https://github.com/voydstack/shellcoding/tree/master/x64/bind-shell)**

Runs a bind-shell on port 4444.

### **[reverse shell (77 bytes)](https://github.com/voydstack/shellcoding/tree/master/x64/reverse-shell)**

Runs a reverse shell on 127.0.0.1:4444.

### **[read file (71 bytes)](https://github.com/voydstack/shellcoding/tree/master/x64/readfile)**

Reads a file (/etc/passwd in the shellcode).

### **[read second stage (23 bytes)](https://github.com/voydstack/shellcoding/tree/master/x64/read-stage)**

Reads a second stage shellcode next to it.

Assemble shellcodes:

```sh
./assemble.sh # Assembles every shellcodes in this directory
# or 
nasm -f bin shellcode.asm -o shellcode.bin
```

To test shellcodes:

```sh
./executor < shellcode.bin
```