#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STR_SIZE 32

extern void six_params(char* motif, ...);

int main() {
    char* second = malloc(10);
    strcpy(second, "second\n");

    char first[] = "first\n";
    six_params(first, second, "third\n", "fourth\n", "fifth\n", "sixth");
    free(second);
    return 0;
}
