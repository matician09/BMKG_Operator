program hello_02
!$OMP PARALLEL NUM_THREADS(4)
    print*, 'hello world'
!$OMP END PARALLEL
endprogram
