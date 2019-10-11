#include <stdio.h>
#include <stdlib.h>

int main() {
    int a[] = {1, 2, 3, 2, 1, 2};

    int max = -__INT_MAX__;

    int i = 0;
    
start:
    if(a[i]>max) {
        max = a[i];
    }

    i++;
    
    if(i<6) {
        goto start;
    }

    printf("%d\n", max);

    return 0;
}