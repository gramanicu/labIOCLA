#include <stdio.h>
#include <malloc.h>

int main() {
    int n = 5, i = 0, target, sol = -1, step = 1;

    target = 2;
    int v[] = {1, 2, 5, 7, 7};

make_step:
    if (step < n) {
        step *= 2;
        goto make_step;
    }

    step /= 2;
    i = 0;

bin_search:
    if (!step) {
        goto end;
    }

    if ((i + step < n && v[i + step] == target)) {
        sol = i + step;
        goto end;
    }

    if (i + step < n && v[i + step] < target) {
        i += step;
    }

    step >>= 1;
    goto bin_search;

end:
    if (sol != -1) {
        printf("Found!\n");
    } else {
        printf("ERROR 404: Not found!\n");
    }

    return 0;
}