# Shellcodes x86

Voici une collection de shellcodes pour x86, pour l'instant ceux-là sont disponibles j'en rajouterai sûrement à l'avenir.

### **[exit(0) (8 octets)](https://github.com/voydstack/shellcoding/tree/master/x86/exit)**

Sort du programme en cours d'exécution avec 0 en code de retour.

### **[Hello, World (41 octets)](https://github.com/voydstack/shellcoding/tree/master/x86/hello)**

Affiche "Hello, World !\n" puis quitte le programme.

### **[/bin/sh (25 octets)](https://github.com/voydstack/shellcoding/tree/master/x86/shell)**

Ouvre un shell sans fixer les permissions.

### **[setreuid /bin/sh (37 octets)](https://github.com/voydstack/shellcoding/tree/master/x86/setreuid-shell)**

Ouvre un shell en fixant les permissions avec setreuid(1000, 1000).

### **[bindshell (115 octets)](https://github.com/voydstack/shellcoding/tree/master/x86/bind-shell)**

Attache un shell au port 1337.

### **[reverse shell (100 octets)](https://github.com/voydstack/shellcoding/tree/master/x86/reverse-shell)**

Se connecte en retour à l'adresse 192.168.1.64 au port 1337.

### **[read /etc/passwd (63 octets)](https://github.com/voydstack/shellcoding/tree/master/x86/readfile)**

Lit un fichier (dans ce cas là /etc/passwd) et affiche son contenu sur stdout.

## Modifier et assembler un shellcode

Pour modifier les shellcodes présents ici, par exemple pour changer le numéro de port, il suffit de faire la modification directement dans le code du shellcode, puis de l'assembler avec la commande:

```sh
nasm -f bin shellcode.asm -o shellcode.bin
```

Pour le tester, on peut utiliser le programme executor32 qui va mapper une zone mémoire exécutable puis l'exécuter avec notre shellcode à l'intérieur.

```sh
cat shellcode.bin | ./executor32
# Ou encore
./executor32 "$(cat shellcode.bin)"
```