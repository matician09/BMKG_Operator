#include <stdio.h>

void functionA() {
    for (int i = 0; i < 100000000; ++i);
}

void functionB() {
    for (int i = 0; i < 50000000; ++i);
}

int main() {
    functionA();
    functionB();
    functionA();
    return 0;
}

