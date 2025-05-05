program hello

        integer nthreads, tid, omp_get_num_threads
        integer omp_get_thread_num

        !$OMP PARALLEL PRIVATE(tid)

        tid = omp_get_thread_num()
        print *, "Hello World from thread = ", tid

        !if (tid .eq. 0) then
                !$OMP SINGLE
                nthreads = omp_get_num_threads()
                print *, "THREADS NUMBER = ", nthreads
                !$OMP END SINGLE
        !endif
        !$OMP END PARALLEL

endprogram hello
