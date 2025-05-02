PROGRAM parallel

 logical is_omp
 is_omp=.TRUE.

!$OMP PARALLEL NUM_THREADS(7) IF(is_omp)
    print*, 'hello if #1'
!$OMP END PARALLEL

!$OMP PARALLEL NUM_THREADS(7) IF(.not.is_omp)
    print*, 'hello if #2'
!$OMP END PARALLEL

ENDPROGRAM
