PROGRAM  := rot13_server
SRC      := rot13_server.c
CC       := clang
CFLAGS   := -O3 -levent

all: clean build

clean:
	rm -rf $(PROGRAM) 

build:
	$(CC) $(CFLAGS) -o $(PROGRAM) $(SRC)

