#include <stdio.h>

__global__ void helloFromGPU(void) {
    printf("Hello World From GPU!\n");
}

int main(void) {
    printf("Hello World From CPU!\n");
    helloFromGPU<<<1,10>>>();
    cudaDeviceReset();
    return 0;
}