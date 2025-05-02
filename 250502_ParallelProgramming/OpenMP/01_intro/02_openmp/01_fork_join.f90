program fork_join

    print*, ' '
    print*, 'hello stage 1'
    print*, ' '

!$OMP PARALLEL NUM_THREADS(3)
    print*, 'hello stage 2'
!$OMP END PARALLEL

    print*, ' '

!$OMP PARALLEL NUM_THREADS(4)
    print*, 'hello stage 3'
!$OMP END PARALLEL

    print*, ' '

!$OMP PARALLEL NUM_THREADS(2)
    print*, 'hello stage 4'
!$OMP END PARALLEL

    print*, ' '

    print*, 'hello stage 5'

endprogram
