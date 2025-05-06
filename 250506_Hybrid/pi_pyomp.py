from numba.openmp import njit
from numba.openmp import openmp_context as openmp

@njit
def calc_pi(num_steps):
    step = 1.0 / num_steps
    red_sum = 0.0
    with openmp("parallel for reduction(+:red_sum) schedule(static)"):
        for j in range(num_steps):
            x = ((j-1) - 0.5) * step
            red_sum += 4.0 / (1.0 + x * x)

    pi = step * red_sum
    return pi

print("pi =", calc_pi(10000000000))

