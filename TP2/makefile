read:
	mkdir -p output
	as -a --gstabs -o output/read.o read.s
	ld -o read output/read.o

print_str:
	mkdir -p output
	as -a --gstabs -o output/print_str.o print_str.s
	ld -o print_str output/print_str.o

str_to_number:
	mkdir -p output
	as -a --gstabs -o output/str_to_number.o str_to_number.s
	ld -o str_to_number output/str_to_number.o

calculator:
	mkdir -p output
	as -a --gstabs -o output/calculator.o calculator.s
	ld -o calculator output/calculator.o

clean:
	rm -f read
	rm -f str_to_number
	rm -f calculator
	rm -f print_str
	rm -rf output