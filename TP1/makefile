clean:
	rm -rf ./output

dir:
	mkdir -p output

sum:
	as -a --gstabs -o output/sum.o sum.s
	ld -o output/sum ./output/sum.o
	./output/sum

ex1:
	as -a --gstabs -o output/ex1.o ex1.s
	ld -o output/ex1 ./output/ex1.o
	./output/ex1

compare:
	as -a --gstabs -o output/compare.o compare.s
	ld -o output/compare ./output/compare.o
	./output/compare

motif:
	as -a --gstabs -o output/motif.o motif.s
	ld -o output/motif ./output/motif.o
	./output/motif

stair:
	as -a --gstabs -o output/stair.o stair.s
	ld -o output/stair ./output/stair.o
	./output/stair