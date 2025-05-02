module load aocc

flang 01_omp_schedule.f90 -fopenmp 

./a.out | sort

echo ' '
export OMP_SCHEDULE="STATIC,1"
./a.out | sort

echo ' '
export OMP_SCHEDULE="GUIDED"
./a.out | sort

#" {STATIC, DYNAMIC, GUIDED}, $CHUNK_SIZE "I 

