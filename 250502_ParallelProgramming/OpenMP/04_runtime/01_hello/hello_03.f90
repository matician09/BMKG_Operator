program hello_03
    integer tid, omp_get_thread_num
    
!$OMP PARALLEL PRIVATE(TID) NUM_THREADS(4)
    tid = omp_get_thread_num()
    print*, 'hello world from thread = ', tid
!$OMP END PARALLEL
endprogram
