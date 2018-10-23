multiply: multiply.o
	gcc -m32 -g -O0 -o $@ $^
multiply.o: multiply.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
