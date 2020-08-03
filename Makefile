all:
hello: main.c
	gcc -o hello main.c
clean:
	rm hello *.o

