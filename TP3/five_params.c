#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STR_SIZE 32

extern void five_params(char* p, ...);

int main() {
    five_params("first\n", "second\n", "third\n", "fourth\n", "fifth\n");
    return 0;
}
