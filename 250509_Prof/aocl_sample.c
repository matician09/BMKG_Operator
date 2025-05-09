#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <cblas.h>  // AOCL BLAS header

#define N 1024  // Size of square matrices (N x N)

// Returns current time in seconds (used for benchmarking)
double get_time_in_seconds() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec + tv.tv_usec * 1e-6;
}

// Initializes a matrix with random double values between 0 and 1
void init_matrix(double* mat, int rows, int cols) {
    for (int i = 0; i < rows * cols; ++i)
        mat[i] = (double)(rand() % 100) / 100.0;
}

int main() {
    int m = N, n = N, k = N;
    double alpha = 1.0, beta = 0.0;

    // Allocate memory for matrices
    double *A = (double*)malloc(sizeof(double) * m * k);
    double *B = (double*)malloc(sizeof(double) * k * n);
    double *C_blas = (double*)malloc(sizeof(double) * m * n);
    double *C_naive = (double*)malloc(sizeof(double) * m * n);

    init_matrix(A, m, k);
    init_matrix(B, k, n);

    // ------------------ BLAS version ------------------
    for (int i = 0; i < m * n; ++i) C_blas[i] = 0.0;

    double t1 = get_time_in_seconds();

    // Perform matrix multiplication using AOCL BLAS
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                m, n, k, alpha, A, k, B, n, beta, C_blas, n);

    double t2 = get_time_in_seconds();
    printf("BLAS dgemm time: %.6f sec\n", t2 - t1);

    // ------------------ Naive version ------------------
    for (int i = 0; i < m * n; ++i) C_naive[i] = 0.0;

    double t3 = get_time_in_seconds();

    // Perform matrix multiplication manually (triple loop)
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            double sum = 0.0;
            for (int p = 0; p < k; ++p) {
                sum += A[i * k + p] * B[p * n + j];
            }
            C_naive[i * n + j] = alpha * sum + beta * C_naive[i * n + j];
        }
    }

    double t4 = get_time_in_seconds();
    printf("Naive matrix multiplication time: %.6f sec\n", t4 - t3);

    // Free memory
    free(A); free(B); free(C_blas); free(C_naive);

    return 0;
}

