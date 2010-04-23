all : matrices

matrices : matrices.o
	$(CXX) -o $@ $^

%.o : %.cpp
	$(CXX) -O0 -g -W -Wall -Werror -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -ansi -pedantic -o $@ -c $<

clean : 
	rm -f *.o matrices

.PHONY : all clean
