mprintf:
	gcc -no-pie -g prog.c mprintf.s -o prog

mprintf_s:
	as -a --gstabs -o mprintf.o mprintf.s
	ld -o mprintf mprintf.o

length:
	gcc -no-pie -g length.c length.s -o length

clean:
	rm -f mprintf.o mprintf prog length