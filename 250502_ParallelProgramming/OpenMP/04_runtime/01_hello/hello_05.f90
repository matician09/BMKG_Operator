program hello_05
    integer tid, omp_get_thread_num
    integer nts, omp_get_num_threads

    call omp_set_num_threads(8)
!$OMP PARALLEL PRIVATE(TID)
    tid = omp_get_thread_num()
    print*, 'hello world from thread = ', tid
    if(tid.eq.0)then
       nts = omp_get_num_threads()
       print*, 'Number of threads =', nts
    endif
!$OMP END PARALLEL
endprogram
