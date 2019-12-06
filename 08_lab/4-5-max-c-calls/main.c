#include <stdio.h>

unsigned int get_max(unsigned int *arr, unsigned int len, unsigned int *pos);

int main(void)
{
	unsigned int arr[] = { 19, 7, 129, 87, 54, 218, 67, 12, 19, 99 };
	unsigned int max;
	unsigned int loc;

	max = get_max(arr, 10, &loc);

	printf("max: %u\n", max);
	printf("location : %d\n", loc);

	return 0;
}
