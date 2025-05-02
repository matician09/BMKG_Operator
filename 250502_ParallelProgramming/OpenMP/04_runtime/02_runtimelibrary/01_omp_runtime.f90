program runtime
    use omp_lib
    !INTEGER omp_get_num_threads, omp_get_thread_num, omp_get_max_threads
    !INTEGER omp_get_max_active_levels
    !LOGICAL omp_get_dynamic

    CALL omp_set_dynamic(.true.)
    !!CALL omp_set_nested(.true.)
    CALL omp_set_max_active_levels(3)

    print *, omp_get_dynamic()
    !!print *, omp_get_nested()
    print *, omp_get_max_active_levels()
    print *, '----'
    write(*,'(3(A,I5))') '# of threads=', omp_get_num_threads(), ',  My thread =',omp_get_thread_num(), ', Max thread =', omp_get_max_threads()
    print *, '----'
!$OMP PARALLEL 
    write(*,'(3(A,I5))') '# of threads=', omp_get_num_threads(), ',  My thread =',omp_get_thread_num(), ', Max thread =', omp_get_max_threads()
!$OMP END PARALLEL
    print *, '----'
    call omp_set_num_threads(5)
!$OMP PARALLEL
    write(*,'(3(A,I5))') '# of threads=', omp_get_num_threads(), ',  My thread =',omp_get_thread_num(), ', Max thread =', omp_get_max_threads()
!$OMP END PARALLEL

endprogram
