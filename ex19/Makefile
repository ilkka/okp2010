all : subscript pointer

subscript : subscript.o
	$(CC) -o $@ $^

pointer : pointer.o
	$(CC) -o $@ $^

%.o : %.c
	$(CC) -O0 -W -Wall -Werror -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -ansi -pedantic -o $@ -c $<

.PHONY : all
