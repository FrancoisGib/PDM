#include <stdio.h>

void print() {
    for (int i = 0; i < 1000; i++) {
        for (int j = 0; j <= i; j++)
            printf("*");
        printf("\n");
    }
}

void main() {
    print();
}