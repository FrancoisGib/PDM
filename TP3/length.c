#include <stdio.h>
#include <inttypes.h>

extern int64_t length(char* chaine);

int main() {
    char* chaine = "ofdsfdsfdsfdsfdsff";
    printf("\n%ld\n", length(chaine));
    return 0;
}
