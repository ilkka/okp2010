all : subscript pointer

subscript : subscript.o
	$(GCC) -o $@ $^

pointer : pointer.o
	$(GCC) -o $@ $^

%.o : %.c
	$(CC) -W -Wall -Werror -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -ansi -pedantic -o $@ -c $<

.PHONY : all
