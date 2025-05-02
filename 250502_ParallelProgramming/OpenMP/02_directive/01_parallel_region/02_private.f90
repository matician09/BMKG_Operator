PROGRAM private

integer prv, fprv, shd

 prv  = 10
 fprv = 10
 shd  = 10

!$OMP PARALLEL NUM_THREADS(4) PRIVATE(prv)
    prv = prv + 1
    print*, 'hello private      ', prv
!$OMP END PARALLEL
    print*, 'master thread      ', prv

    print*, ' '
!$OMP PARALLEL NUM_THREADS(4) FIRSTPRIVATE(fprv)
    fprv = fprv + 1
    print*, 'hello first private', fprv
!$OMP END PARALLEL
    print*, 'master thread      ', fprv

    print*, ' '
!$OMP PARALLEL NUM_THREADS(4) SHARED(shd)
    shd = shd + 1
    print*, 'hello shared       ', shd
!$OMP END PARALLEL
    print*, 'master thread      ', shd

ENDPROGRAM
