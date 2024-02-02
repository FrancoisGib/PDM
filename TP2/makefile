read:
	mkdir -p output
	as -a --gstabs -o output/read.o read.s
	ld -o output/read output/read.o

str_to_number:
	mkdir -p output
	as -a --gstabs -o str_to_number.o str_to_number.s
	ld -o output/str_to_number str_to_number.o

add:
	mkdir -p output
	as -a --gstabs -o output/add.o add.s
	ld -o output/add output/add.o

ex:
	mkdir -p output
	as -a --gstabs -o output/str_to_num.o str_to_num.s
	ld -o output/str_to_num output/str_to_num.o

clean:
	rm -rf output