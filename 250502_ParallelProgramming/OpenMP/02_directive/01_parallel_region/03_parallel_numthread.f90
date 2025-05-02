program parallel

!$OMP PARALLEL NUM_THREADS(2)
    print*, 'hello num #2'
!$OMP END PARALLEL
    print*, ' '
!$OMP PARALLEL NUM_THREADS(4)
    print*, 'hello num #4'
!$OMP END PARALLEL
    print*, ' '
!$OMP PARALLEL NUM_THREADS(9)
    print*, 'hello num #9'
!$OMP END PARALLEL

endprogram
