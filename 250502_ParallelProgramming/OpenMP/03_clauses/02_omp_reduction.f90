PROGRAM REDUCTION

IMPLICIT NONE

integer,parameter :: ndim=5 !!5432
real*8  :: A(ndim,ndim)
real*8  :: ASUM, BSUM
real*8  :: MINA, MAXA
integer :: I, J

A = 0.0

!! ***** Setup Matrix A ***** !!

!$OMP PARALLEL DO PRIVATE(I,J)
DO J = 1, ndim
  DO I = 1, ndim
     A(I,J) = i+j
  END DO
END DO
!$OMP END PARALLEL DO

ASUM = 0.0
!!!$OMP PARALLEL DO PRIVATE(I,J,ASUM)
!$OMP PARALLEL 
!$OMP DO PRIVATE(I,J)
DO J = 1, ndim
  DO I = 1, ndim
     ASUM = ASUM + A(I,J)
  END DO
END DO
!$OMP END DO
!$OMP END PARALLEL
!!!$OMP END PARALLEL DO

PRINT*, 'Total Sum #1 is : ', DBLE(ASUM)

BSUM = 10.0
!$OMP PARALLEL DO PRIVATE(I,J) REDUCTION(+:BSUM)
DO J = 1, ndim
  DO I = 1, ndim
     BSUM = BSUM + A(I,J)
  END DO
END DO
!$OMP END PARALLEL DO

PRINT*, 'Total Sum #2 is : ', DBLE(BSUM)

PRINT*, 'Sum is : ', DBLE(SUM(A))


MINA = MAXVAL(A)
!$OMP PARALLEL DO PRIVATE(I,J) REDUCTION(MIN:MINA)
DO J = 1, ndim
  DO I = 1, ndim
     MINA = MIN(MINA,A(I,J))
  END DO
END DO
!$OMP END PARALLEL DO

PRINT*, 'Total Minimum is : ', DBLE(MINA)


MAXA = MINVAL(A)
!$OMP PARALLEL DO PRIVATE(I,J) REDUCTION(MAX:MAXA)
DO J = 1, ndim
  DO I = 1, ndim
     MAXA = MAX(MAXA,A(I,J))
  END DO
END DO
!$OMP END PARALLEL DO

PRINT*, 'Total Maximum is : ', DBLE(MAXA)


END PROGRAM REDUCTION
