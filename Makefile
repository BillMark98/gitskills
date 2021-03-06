myjob: a.txt source.txt result.txt #var-kept test
#%: force
#	@$(MAKE) -f Makefile $@
#force: ;
a.txt: b.txt c.txt
	cat b.txt c.txt > a.txt
#include rules.txt
source.txt:
	echo "this is the source" > source.txt
result.txt: source.txt
	cp source.txt result.txt

var-kept:
	export foo=bar;	\
	echo "foo=[$$foo]"
txt = Hello World
.SECONDEXPANSION:
test:
	@echo $(txt) $$
.PHONY: clean
clean:
	rm a.txt source.txt result.txt var-kept test
rebuildAll:
	make
SRC = hello.c
CC = /usr/bin/gcc
DEPENDFILE = .depend
VPATH=/usr/local/include:/usr/include
#SRCS = hello.c
#CFLAGS = -O -DHACK -I../foobar -xyz
#depend:
#	makedepend -- $(CFLAGS) -- $(SRCS)
dep: $(SRC)
	$(CC) -MM $(SRC)> $(DEPENDFILE)
-include $(DEPENDFILE)
hello: hello.c stdio.h string.h stdlib.h
	gcc -o hello hello.c
