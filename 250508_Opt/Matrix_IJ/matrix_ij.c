#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 4096

double A[N][N];

// Row-major traversal (cache-friendly)
void row_major_access() {
    double sum = 0.0;
    for (int i = 0; i < N; ++i)
        for (int j = 0; j < N; ++j)
            sum += A[i][j];
    printf("Row-major sum: %f\n", sum);
}

// Column-major traversal (cache-unfriendly in C)
void col_major_access() {
    double sum = 0.0;
    for (int j = 0; j < N; ++j)
        for (int i = 0; i < N; ++i)
            sum += A[i][j];
    printf("Column-major sum: %f\n", sum);
}

int main() {
    // Initialize matrix
    for (int i = 0; i < N; ++i)
        for (int j = 0; j < N; ++j)
            A[i][j] = (i + j) * 0.5;

    clock_t start, end;

    // Measure row-major access time
    start = clock();
    row_major_access();
    end = clock();
    printf("Row-major time: %.3f sec\n", (double)(end - start) / CLOCKS_PER_SEC);

    // Measure column-major access time
    start = clock();
    col_major_access();
    end = clock();
    printf("Column-major time: %.3f sec\n", (double)(end - start) / CLOCKS_PER_SEC);

    return 0;
}

