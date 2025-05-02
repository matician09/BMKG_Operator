PROGRAM data_scope

integer tid, omp_get_thread_num, old, new

old = 2021
print*, 'Input = ',old

!$OMP PARALLEL PRIVATE(TID) NUM_THREADS(8)
 tid = omp_get_thread_num()
 new = old + 10000*tid
 print*, 'hello world from thread = ', tid, new
!$OMP END PARALLEL

ENDPROGRAM
