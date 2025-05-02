PROGRAM hello

!$OMP PARALLEL
    print*, 'hello world from fortran'
!$OMP END PARALLEL

ENDPROGRAM
