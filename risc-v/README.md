# Linux Shellcodes - MIPS (MIPS 32 bits, big endian)

Here is a RISC-V space, newline and null-byte free shellcode collection.

### **[exit(0) (32 bytes)](https://github.com/voydstack/shellcoding/tree/master/risc-v/exit)**

Simply exits.

### **[Hello, World (56 bytes)](https://github.com/voydstack/shellcoding/tree/master/risc-v/hello)**

Writes "Hello,World!" to stdout.

### **[/bin/sh (48 bytes)](https://github.com/voydstack/shellcoding/tree/master/risc-v/shell)**

Executes a shell (/bin/sh).

### **[setreuid /bin/sh (68 bytes)](https://github.com/voydstack/shellcoding/tree/master/risc-v/setreuid-shell)**

Executes a shell with setreuid privilege.

### **[bind shell (152 bytes)](https://github.com/voydstack/shellcoding/tree/master/risc-v/bind-shell)**

Classic bind shell.

### **[reverse shell (132 bytes)](https://github.com/voydstack/shellcoding/tree/master/risc-v/reverse-shell)**

Classic reverse shell.

### **[read /etc/passwd (108 bytes)](https://github.com/voydstack/shellcoding/tree/master/risc-v/readfile)**

Reads a file and displays its output to stdout.

### **[read second stage (38 bytes)](https://github.com/voydstack/shellcoding/tree/master/risc-v/read-stage)**

Reads a second-stage shellcode next to it (position independent)

## Assemble shellcodes

```sh
riscv64-linux-gnu-gcc shellcode.s -c && riscv64-linux-gnu-ld shellcode.o -o shellcode
riscv64-linux-gnu-objcopy -O binary shellcode shellcode.bin && rm shellcode.o shellcode
```

Run shellcodes:

```sh
qemu-riscv64 -L /usr/riscv64-linux-gnu/ ./executor < shellcode.bin
```

## References:

- [https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf](https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf)
- [http://csl.snu.ac.kr/courses/4190.307/2020-1/riscv-user-isa.pdf](http://csl.snu.ac.kr/courses/4190.307/2020-1/riscv-user-isa.pdf)
- [https://www.cs.sfu.ca/~ashriram/Courses/CS295/assets/notebooks/RISCV/RISCV_CARD.pdf](https://www.cs.sfu.ca/~ashriram/Courses/CS295/assets/notebooks/RISCV/RISCV_CARD.pdf)
- [https://modexp.wordpress.com/2017/09/11/shellcode-linux-risc-v/](https://modexp.wordpress.com/2017/09/11/shellcode-linux-risc-v/)
- [https://î.fr/riscv-alphanumeric-shellcoding/defcon27_riscv-alphanumeric-shellcoding.pdf](https://î.fr/riscv-alphanumeric-shellcoding/defcon27_riscv-alphanumeric-shellcoding.pdf)