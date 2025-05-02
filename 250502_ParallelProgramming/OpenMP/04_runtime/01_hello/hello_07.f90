program hello_06
    integer tid, omp_get_thread_num
    integer nts, omp_get_num_threads
    integer mth, omp_get_max_threads

    mth = omp_get_max_threads()
    call omp_set_num_threads(mth)
!$OMP PARALLEL PRIVATE(TID) NUM_THREADS(2)
    tid = omp_get_thread_num()
    print*, 'hello world from thread = ', tid
    if(tid.eq.0)then
       nts = omp_get_num_threads()
       print*, 'Number of threads =', nts
    endif
!$OMP END PARALLEL
endprogram
