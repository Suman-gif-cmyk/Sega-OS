all: os-image

boot.o: boot asm
nasm -f bin boot.asm -o boot.o

kernel.o: kernnel.c
i386-elf-gcc -ffreestanding -c kernel.c -o kernel.o

kernel.bin: kernel.o
i386-rlf-ld -T linker.ld -o  kernel.bin kernel.o

os-image: boot.o kernel.bin
cat boot.o kernel.bin > os-image.bin

run: os-image
qemu-system-x86_64 -drive format=raw, file=os-image.bin

clean:
rm -f *.o *.bin
