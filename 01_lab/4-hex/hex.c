#include<stdio.h>

int main()
{
    // TODO declare a char[] variable that stores the string
    char a[] = "48455820526F636B73210A";
    for(int i = 0 ; i < sizeof(a); i+= 2) {
        char c1 = a[i];
        char c2 = a[i+1];

        if(c1 >= '0' && c1 <= '9') c1 -= '0';
        if(c2 >= '0' && c2 <= '9') c2 -= '0';
        if(c1 >= 'A' && c1 <= 'Z') c1 -= ('A' - 10);
        if(c2 >= 'A' && c2 <= 'Z') c2 -= ('A' - 10);
        if(c1 >= 'a' && c1 <= 'z') c1 -= ('a' - 10);
        if(c2 >= 'a' && c2 <= 'z') c2 -= ('a' - 10);

        printf("%c", c1 * 16 + c2);
    }

    return 0;
}
