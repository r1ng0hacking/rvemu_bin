all : bin

bin : bin.s
	riscv64-unknown-elf-gcc -O0 -Wl,-Ttext=0x0 -nostdlib -o elf_file bin.s
	riscv64-unknown-elf-objcopy -O binary elf_file bin
bin.s : bin.c
	riscv64-unknown-elf-gcc -S -fPIC bin.c
	
clean:
	rm -f elf_file
	rm -f bin
