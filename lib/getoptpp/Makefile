all:
	g++ -std=c++11 src/getopt_pp.cpp -I. -c
	mkdir -p bin/
	mv getopt_pp.o bin/
	ar rcs libgetoptpp.a bin/getopt_pp.o
	mv libgetoptpp.a bin/
clean:
	rm bin/*
	rm -r bin

