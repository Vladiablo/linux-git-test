#
# Makefile
#

CC = gcc
CFLAGS =
LIBS = -lm

debug: CFLAGS += -g
debug: calculator

release: CFLAGS += -O2
release: calculator

calculator: calculate.o main.o
	gcc calculate.o main.o -o bin/calculator $(LIBS)

calculate.o: calculate.c calculate.h
	gcc -c calculate.c $(CFLAGS)

main.o: main.c calculate.h
	gcc -c main.c $(CFLAGS)

clean:
	$(RM) bin/calculator *.o *~
