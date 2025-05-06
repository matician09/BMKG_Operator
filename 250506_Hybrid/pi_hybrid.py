from mpi4py import MPI
from numba.openmp import njit
from numba.openmp import openmp_context as openmp

@njit
def calc_partial_pi(start, end, step):
    red_sum = 0.0
    with openmp("parallel for reduction(+:red_sum) schedule(static)"):
        for j in range(start, end):
            x = (j + 0.5) * step
            red_sum += 4.0 / (1.0 + x * x)
    return red_sum

def main():
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()

    num_steps = 100000000
    step = 1.0 / num_steps

    # range for MPI tasks
    chunk = num_steps // size
    start = rank * chunk
    end = num_steps if rank == size - 1 else (rank + 1) * chunk

    # Using OpenMP
    local_sum = calc_partial_pi(start, end, step)
    local_pi = step * local_sum

    # Reduce using MPI
    total_pi = comm.reduce(local_pi, op=MPI.SUM, root=0)

    if rank == 0:
        print(f"Estimated value of pi: {total_pi:.16f}")

if __name__ == "__main__":
    main()

