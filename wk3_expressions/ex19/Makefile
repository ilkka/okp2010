all : subscript pointer

subscript : subscript.o
	$(CC) -o $@ $^

pointer : pointer.o
	$(CC) -o $@ $^

%.o : %.c
	$(CC) -O0 -g -W -Wall -Werror -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -ansi -pedantic -o $@ -c $<

clean : 
	rm -f *.o pointer subscript

.PHONY : all clean
