#!/bin/sh

for file in $(find . -name "*.s")
do
    filename=${file%.*}
    riscv64-linux-gnu-gcc $file -c -o $filename.o
    riscv64-linux-gnu-ld $filename.o -o $filename
    riscv64-linux-gnu-objcopy -O binary $filename $filename.bin
    rm $filename $filename.o
    python ../shellconvert.py $filename.bin > $filename.hex
done
