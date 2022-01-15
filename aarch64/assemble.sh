#!/bin/sh

for file in $(find . -name "*.s")
do
    filename=${file%.*}
    aarch64-linux-gnu-as $file -o $filename.o
    aarch64-linux-gnu-ld $filename.o -o $filename
    aarch64-linux-gnu-objcopy -O binary $filename $filename.bin
    rm $filename $filename.o
    python ../shellconvert.py $filename.bin > $filename.hex
done