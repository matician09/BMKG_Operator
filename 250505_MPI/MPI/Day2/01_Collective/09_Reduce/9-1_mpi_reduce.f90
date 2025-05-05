PROGRAM reduce
  IMPLICIT NONE

INCLUDE 'mpif.h'

REAL    :: a(9)
INTEGER :: ierr, myrank, ista, iend, i
REAL    :: sum, tmp

CALL MPI_INIT(ierr)
CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

ista = myrank*3 + 1
iend = ista + 2

do i = ista, iend
    a(i) = i
enddo

sum = 0.0
do i = ista, iend
    sum = sum + a(i)
enddo

PRINT*, 'MYRANK=', MYRANK, 'SUM=',SUM
CALL MPI_BARRIER(MPI_COMM_WORLD,IERR)
CALL MPI_REDUCE(sum, tmp, 1, MPI_REAL, MPI_SUM,  0, MPI_COMM_WORLD, ierr) ; if(myrank.eq.0) print*, 'MPI_SUM =',tmp
CALL MPI_REDUCE(sum, tmp, 1, MPI_REAL, MPI_MAX,  0, MPI_COMM_WORLD, ierr) ; if(myrank.eq.0) print*, 'MPI_MAX =',tmp
CALL MPI_REDUCE(sum, tmp, 1, MPI_REAL, MPI_MIN,  0, MPI_COMM_WORLD, ierr) ; if(myrank.eq.0) print*, 'MPI_MIN =',tmp
CALL MPI_REDUCE(sum, tmp, 1, MPI_REAL, MPI_PROD, 0, MPI_COMM_WORLD, ierr) ; if(myrank.eq.0) print*, 'MPI_PROD=',tmp

!   MYRANK=           0 SUM=   6.000000
!   MYRANK=           1 SUM=   15.00000
!   MYRANK=           2 SUM=   24.00000
!   MPI_SUM =   45.00000
!   MPI_MAX =   24.00000
!   MPI_MIN =   6.000000
!   MPI_PROD=   2160.000



CALL MPI_FINALIZE(ierr)

END PROGRAM reduce
