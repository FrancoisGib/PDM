read:
	mkdir -p output
	as -a --gstabs -o output/read.o read.s
	ld -o read output/read.o

add:
	mkdir -p output
	as -a --gstabs -o output/add.o add.s
	ld -o add output/add.o

str_to_number:
	mkdir -p output
	as -a --gstabs -o output/str_to_num.o str_to_num.s
	ld -o str_to_num output/str_to_num.o

print_str:
	mkdir -p output
	as -a --gstabs -o output/print_str.o print_str.s
	ld -o print_str output/print_str.o

str_to_number2:
	mkdir -p output
	as -a --gstabs -o output/str_to_number2.o str_to_number2.s
	ld -o str_to_number2 output/str_to_number2.o

clean:
	rm read
	rm str_to_num
	rm add
	rm -rf output