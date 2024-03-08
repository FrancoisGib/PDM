#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>

extern void mprintf(char* motif, char* chaine);

int main() {
    char* motif = "fdsfs %s fdsfs";
    char* src = "okdsqdds";
    mprintf(motif, src);
    return 0;
}
