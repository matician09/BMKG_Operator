#include <stdio.h>

int main () {
	int sum = 0;
	int tar = 10000;

	for (int i=0; i<=tar; i++) {
		sum = sum + i;
	}

	printf("%d \n", sum);

	return 0;
}
