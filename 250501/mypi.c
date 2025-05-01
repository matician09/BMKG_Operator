#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int main() {
    int pt_count = 0;
    int total_count = 10000;
    double px, py, r_val;

    // Random seed
    srand((unsigned int)time(NULL));

    for (int i = 0; i < total_count; i++) {
        px = (double)rand() / RAND_MAX; // 0.0 ~ 1.0 Random Number
        py = (double)rand() / RAND_MAX;
        r_val = sqrt(px * px + py * py);

        if (r_val < 1.0) {
            pt_count++;
        }
    }

    double pi_estimate = (double)pt_count / total_count * 4.0;
    printf("Estimated Pi = %f\n", pi_estimate);

    return 0;
}

