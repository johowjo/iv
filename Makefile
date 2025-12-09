CC=gcc
CPPFLAGS=-Ilib/SDL/include/
LDFLAGS=-Llib/SDL/build/
LDFLAGS += -Wl -rpath lib/SDL/build
LDLIBS=-lsdl3
CFLAGS=

SRC=$(wildcard src/*.c)
OBJ=$(SRC:.c=.o)


%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

main: $(OBJ)
	$(CC) $^ $(LDFLAGS) $(LDLIBS) -o bin/$@

clean:
	rm -f src/*.o bin/*

all: main
