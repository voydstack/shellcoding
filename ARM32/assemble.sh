#!/bin/sh

for file in $(find . -name "*.s")
do
    filename=${file%.*}
    arm-linux-gnueabihf-gcc $file -c -o $filename.o
    arm-linux-gnueabihf-ld $filename.o -o $filename
    arm-linux-gnueabihf-objcopy -O binary $filename $filename.bin
    rm $filename $filename.o
    python ../shellconvert.py $filename.bin > $filename.hex
done
