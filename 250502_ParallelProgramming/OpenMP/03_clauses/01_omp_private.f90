program private
    integer prv, lprv

    prv  = 50
    lprv = 50

!$OMP PARALLEL NUM_THREADS(3)
!$OMP DO PRIVATE(prv)
    do i=1,10
       prv = prv + 1
    enddo
!$OMP END DO
    print*, 'hello private', prv

!!!$OMP DO LASTPRIVATE(lprv)
!$OMP DO REDUCTION(+:lprv)
    do i=1,6
       lprv = lprv + i
       print*, lprv
    enddo
!$OMP END DO
    print*, 'hello last private ', lprv

!$OMP END PARALLEL
   
    print*, 'hello      private ', prv
    print*, 'hello last private ', lprv

endprogram
