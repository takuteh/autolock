CC=gcc
LIBS=-lpigpiod_if2
PROGRAMS=close open

all: $(PROGRAMS)

close: close.o
	$(CC) -o close close.o $(LIBS)

open: open.o
	$(CC) -o open open.o $(LIBS)

.c.o:
	$(CC) -c $< -o $@

clean:
	rm -f *.o $(PROGRAMS)

.PHONY: clean all

