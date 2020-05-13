# Shellcodes Linux ARMv7 (32 bits)

Voici une collection de shellcodes pour Linux ARMv7, pour l'instant ceux-là sont disponibles j'en rajouterai sûrement à l'avenir.

### **[exit(0) (16 octets)](https://github.com/voydstack/shellcoding/tree/master/ARM32/exit)**

Sort du programme en cours d'exécution avec 0 en code de retour.

### **[Hello, World (43 octets)](https://github.com/voydstack/shellcoding/tree/master/ARM32/hello)**

Affiche "Hello, World !\n" puis quitte le programme.

### **[/bin/sh (28 octets)](https://github.com/voydstack/shellcoding/tree/master/ARM32/shell)**

Ouvre un shell sans fixer les permissions.

### **[setreuid /bin/sh (40 octets)](https://github.com/voydstack/shellcoding/tree/master/ARM32/setreuid-shell)**

Ouvre un shell en fixant les permissions avec setreuid(1000, 1000).

### **[bindshell (104 octets)](https://github.com/voydstack/shellcoding/tree/master/ARM32/bind-shell)**

Attache un shell au port 1337.

### **[reverse shell (84 octets)](https://github.com/voydstack/shellcoding/tree/master/ARM32/reverse-shell)**

Se connecte en retour à l'adresse 192.168.1.64 au port 1337.

### **[read /etc/passwd (52 octets)](https://github.com/voydstack/shellcoding/tree/master/ARM32/readfile)**

Lit un fichier (dans ce cas là /etc/passwd) et affiche son contenu sur stdout.

## Modifier et assembler un shellcode

Pour modifier les shellcodes présents ici, par exemple pour changer le numéro de port, il suffit de faire la modification directement dans le code du shellcode, puis de l'assembler avec la commande:

```sh
as shellcode.s -o shellcode.o && ld shellcode.o -N -o shellcode
objcopy -O binary shellcode shellcode.bin && rm shellcode.o shellcode
```

Pour le tester, on peut utiliser le programme executor qui va mapper une zone mémoire exécutable puis l'exécuter avec notre shellcode à l'intérieur.

```sh
cat shellcode.bin | ./executor
# Ou encore
./executor "$(cat shellcode.bin)"
```