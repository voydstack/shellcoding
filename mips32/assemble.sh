#!/bin/sh

for file in $(find . -name "*.s")
do
    filename=${file%.*}
    mips-linux-gnu-as $file -o $filename.o
    mips-linux-gnu-ld $filename.o -o $filename
    mips-linux-gnu-objcopy -O binary --only-section=.text $filename $filename-tmp.bin
    sed '$ s/\x00*$//' $filename-tmp.bin > $filename.bin
    rm $filename-tmp.bin $filename $filename.o
    python ../shellconvert.py $filename.bin > $filename.hex
done
