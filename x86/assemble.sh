#!/bin/sh

for file in $(find . -name "*.asm")
do
    filename=${file%.*}
    nasm -f bin $file -o $filename.bin
    python ../shellconvert.py $filename.bin > $filename.hex
done
