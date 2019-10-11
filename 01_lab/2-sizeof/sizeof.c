#include <stdio.h>
int main()
{
    char charT;
    short shortT;
    int integerT;	
    unsigned int unsignedIntegerT;
    long longT;
    long long longlongT;
    void * voidT;

    // TODO - use sizeof to print size of the above types
    printf("char : %ld\n", sizeof(charT));
    printf("short : %ld\n", sizeof(shortT));
    printf("integer : %ld\n", sizeof(integerT));
    printf("unsigned : integer %ld\n", sizeof(unsignedIntegerT));
    printf("long : %ld\n", sizeof(longT));
    printf("long long : %ld\n", sizeof(longlongT));
    printf("void * : %ld\n", sizeof(voidT));

    return 0;
}
