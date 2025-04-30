#include <stdio.h>

int main () {
	float sum = 0;
	float tar = 10000;
	float res;

	res = tar * (1 + tar) / 2 ;

	printf("%f \n", res);

	return 0;
}
