#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STR_SIZE 32

extern void mprintf(char* motif, ...);

int main() {

    mprintf("dsqd", "\nok");

    return 0;
}
