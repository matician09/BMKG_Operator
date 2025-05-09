#include <stdio.h>

int main() {
    int a = 5;
    int b = 0;
    int c = a / b; // runtime error
    printf("Result: %d\n", c);
    return 0;
}

