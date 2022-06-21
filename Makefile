EXE = iswitch
default: bin main.o helpers.o
	g++ -o bin/$(EXE) main.o helpers.o -static
main.o:
	g++ -c -o main.o src/main.cpp -static
helpers.o:
	g++ -c -o helpers.o src/helpers.cpp -static
win64: bin main.win64.o helpers.win64.o
	x86_64-w64-mingw32-g++ -o bin/$(EXE).x86_64.exe main.win64.o helpers.win64.o -static
main.win64.o:
	x86_64-w64-mingw32-g++ -c -o main.win64.o  src/main.cpp -static
helpers.win64.o:
	x86_64-w64-mingw32-g++ -c -o helpers.win64.o  src/helpers.cpp -static
win32: bin main.win32.o helpers.win32.o
	i686-w64-mingw32-g++ -o bin/$(EXE).i686.exe main.win32.o helpers.win32.o -static
main.win32.o:
	i686-w64-mingw32-g++ -c -o main.win32.o  src/main.cpp -static
helpers.win32.o:
	i686-w64-mingw32-g++ -c -o helpers.win32.o  src/helpers.cpp -static
bin:
	mkdir bin
all: default win64 win32
clean:
	rm -f *.o
	rm -rf bin
help:
	@echo "Make file was built for Ubuntu Linux"
	@echo "To build for Windows MinGW is required."
	@echo "Install with sudo apt install mingw-w64"
	@echo "make       - builds $(EXE) for Linux"
	@echo "make win32 - builds $(EXE) for Windows 32-bit"
	@echo "make win64 - builds $(EXE) for Windows 64-bit"
	@echo "make all   - builds $(EXE) for Linux, Windows 64, and 32-bit"
	@echo "make clean - removes object files and executables"
