read:
	mkdir -p output
	as -a --gstabs -o output/read.o read.s
	ld -o read output/read.o
	rm -rf output

print_str:
	mkdir -p output
	as -a --gstabs -o output/print_str.o print_str.s
	ld -o print_str output/print_str.o
	rm -rf output

str_to_number:
	mkdir -p output
	as -a --gstabs -o output/str_to_number.o str_to_number.s
	ld -o str_to_number output/str_to_number.o
	rm -rf output

calculator:
	mkdir -p output
	as -a --gstabs -o output/calculator.o calculator.s
	ld -o calculator output/calculator.o
	rm -rf output

post-fixed-calculator:
	mkdir -p output
	cat post-fixed-calculator.s > output/post-fixed-calculator.s
	echo ".global _start\n_start:\n\tcall post_fixed_calculator\nret" >> output/post-fixed-calculator.s
	as -a --gstabs -o output/post-fixed-calculator.o output/post-fixed-calculator.s
	ld -o post-fixed-calculator output/post-fixed-calculator.o
	rm -rf output

link:
	gcc post-fixed-calculator.c post-fixed-calculator.s -no-pie -o post-fixed-calculator

mmencopy:
	mkdir -p output
	as -a --gstabs -o output/mmemcopy.o mmemcopy.s
	ld -o mmemcopy output/mmemcopy.o

clean:
	rm -f post-fixed-calculator
	rm -f read
	rm -f str_to_number
	rm -f calculator
	rm -f print_str
	rm -rf output
	rm -f mmemcopy