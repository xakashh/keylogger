DIRECTORY = bin/

all:
	cd lib/getoptpp && make
	mkdir -p bin
	g++ -Wall -std=c++11 -I. main.cpp -c
	mv main.o bin/
	g++ -Wall -std=c++11 -I. keyname.cpp -c
	mv keyname.o bin/
	g++ -Wall -std=c++11 -I. util.cpp -c
	mv util.o bin/
	g++ -Wall -std=c++11 -I. timerunit.cpp -c
	mv timerunit.o bin/
	g++ -Wall -std=c++11 -o Dodder bin/main.o bin/keyname.o \
	bin/util.o bin/timerunit.o -L lib/getoptpp/bin/ -lgetoptpp
	mv Dodder bin/
	cp .start.desktop bin/start.desktop
	cp .start.sh bin/.start.sh
	cp .pic.jpg bin/
	mkdir -p build
	cp bin/Dodder build/
	cp bin/.pic.jpg build/
	cp bin/.start.sh build/
	cp bin/start.desktop build/
	cp  script/.uploadConfig.sh build/
	cp script/.systemConfig.sh build/
clean:
	rm bin/main.o bin/keyname.o bin/Dodder bin/util.o
	rm -r bin
	rm -r build
	cd lib/getoptpp && make clean
