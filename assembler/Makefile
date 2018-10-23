all: prog show_byte

prog: code.o code_main.c
	gcc -o prog code.o code_main.c
code.o: code.c
	gcc -c code.c
show_byte: show_byte.o
	gcc -O0 -g -o $@ $^
CC = gcc
ASMFLAGS = -f elf32 -O0 -g -F dwarf
CCFLAGS = -O0 -g 
LDFLAGS = -o

# .asm .o:
# 	nasm $(ASMFLAGS) $(LDFLAGS) $@ $^
flags.o: flags.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
flags: flags.ow
	gcc -m32 -g -O0 -o $@ $^
fib.o: fib.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
myfib: fib.o myfib.c
	gcc -m32 -g -O0 -o $@ $^
fib_recur.o: fib_recur.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
my_fib_recur: fib_recur.o
	gcc -m32 -g -O0 -o $@ $^
fibz.o: fibz.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
mainz: mainz.c fibz.o
	gcc -m32 -g -O0 -o $@ $^
flagjnz: flagjnz.o
	gcc -m32 -g -O0 -o $@ $^
flagjnz.o: flagjnz.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
kangeroo:kangeroo.o
	gcc -m32 -g -O0 -o $@ $^
kangeroo.o: kangeroo.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
movsx_sign: movsx_sign.o
	gcc -m32 -g -O0 -o $@ $^
movsx_sign.o: movsx_sign.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
#
func_name: func_name.c
	gcc -pthread -o func_name func_name.c
multi:	multi.c
	gcc -pthread -o multi multi.c

var-lost:
	export foo=bar;echo "foo=[$$foo]"
exch:
	echo $(subst ee,EE,feet on the street)
eatsyscall: eatsyscall.o
	ld -melf_i386 -o $@ $^
eatsyscall.o: eatsyscall.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
push_pop: push_pop.o
	gcc -m32 -g -O0 -o $@ $^
push_pop.o: push_pop.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
uppercase.o: uppercase.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
uppercase: uppercase.o
	gcc -m32 -g -O0 -o $@ $^
uppercase2: uppercase2.o
	gcc -m32 -g -O0 -o $@ $^
uppercase2.o: uppercase2.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
stosb_first: stosb_first.o
	gcc -m32 -O0 -g -o $@ $^
stosb_first.o: stosb_first.asm	
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
movsb_first: movsb_first.o
	gcc -m32 -O0 -g -o $@ $^
movsb_first.o: movsb_first.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
movsb_std: movsb_std.o
	gcc -m32 -O0 -g -o $@ $^
movsb_std.o: movsb_std.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
myenv: myenv.c
	gcc -o $@ $^
displayenv: displayenv.c
	gcc -o $@ $^
quadrat: quadrat.o
	gcc -m32 -O0 -g -o $@ $^
quadrat.o: quadrat.asm
	nasm -f elf32 -O0 -g -F dwarf -o $@ $^
myfib_rec.o:myfib_rec.asm
	nasm $(ASMFLAGS) $(LDFLAGS) $@ $^
myfib_rec: myfib_rec.o
	gcc -m32 $(CCFLAGS) $(LDFLAGS) $@ $^
test_fib.o: test_fib.asm
	nasm $(ASMFLAGS) $(LDFLAGS) $@ $^
test_fib: test_fib.o
	gcc -m32 -O0 -g -o $@ $^
polynom.o: polynom.asm
	nasm $(ASMFLAGS) $(LDFLAGS) $@ $^
polynom: polynom.o
	gcc -m32 $(CCFLAGS) $(LDFLAGS) $@ $^
hex_dec.o: hex_dec.asm
	nasm $(ASMFLAGS) $(LDFLAGS) $@ $^
hex_dec: hex_dec.o
	gcc -m32 $(CCFLAGS) $(LDFLAGS) $@ $^
picalculate.o: picalculate.asm
	nasm $(ASMFLAGS) $(LDFLAGS) $@ $^
picalculate: picalculate.o
	gcc -m32 $(CCFLAGS) $(LDFLAGS) $@ $^
calcPi_SSE.o: calcPi_SSE.asm
	nasm $(ASMFLAGS) $(LDFLAGS) $@ $^
ssepi: ssepi.c calcPi_SSE.o
	gcc -m32 $(CCFLAGS) $(LDFLAGS) $@ $^
foobar5: foo5.c bar5.c
	gcc -o $@ $^
hello: hello.c
	gcc -Wall hello.c -lpthread -o hello
exit_join: exit_join.c
	gcc -Wall -pthread -o exit_join exit_join.c
mutex_veclen: mutex_veclen.c
	gcc -Wall -pthread -o mutex_veclen mutex_veclen.c
mutex_pi: mutex_pi.c
	gcc -Wall -pthread -o $@ $^
parallel_pi: parallel_pi.c
	gcc -Wall -pthread -o $@ $^
hexdump.o: hexdump.asm
	nasm $(ASMFLAGS) $(LDFLAGS) $@ $^
hexdump: hexdump.o
	gcc -m32 $(CCFLAGS) $(LDFLAGS) $@ $^
mytest.o: mytest.asm
	nasm $(ASMFLAGS) $(LDFLAGS) $@ $^
mytest: mytest.o
	gcc -m32 $(CCFLAGS) $(LDFLAGS) $@ $^
chen: chen.c
	gcc -m32 $(CCFLAGS) $(LDFLAGS) $@ $^
.PHONY: clean
clean:
	rm *.o