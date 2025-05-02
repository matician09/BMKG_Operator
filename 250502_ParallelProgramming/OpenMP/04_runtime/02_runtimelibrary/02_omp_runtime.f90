program runtime
 
    INTEGER omp_get_max_threads
    integer omp_get_thread_num
    integer omp_get_num_threads

    call omp_set_dynamic(.true.)
    print*, "TRUE"

    call omp_set_num_threads(10)

!$OMP PARALLEL NUM_THREADS(10)
    print*, omp_get_thread_num(), omp_get_max_threads(), omp_get_num_threads()
!$OMP END PARALLEL
    
    print*, ""

    call omp_set_dynamic(.false.)
    print*, "FALSE"
!$OMP PARALLEL NUM_THREADS(10)
    print*, omp_get_thread_num(), omp_get_max_threads(), omp_get_num_threads()
!$OMP END PARALLEL

endprogram
