PROGRAM bcast
IMPLICIT NONE

INCLUDE 'mpif.h'

integer :: imsg(4)
integer :: ierr, myrank
integer :: i

CALL MPI_INIT(ierr)
CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

if (myrank==0) then
    do i = 1, 4
        imsg(i) = i
    enddo
else
    do i = 1, 4
        imsg(i) = 0
    enddo
endif

print*, 'Before : ', imsg, 'Rank: ', myrank
CALL MPI_BCAST(imsg, 4, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)
print*, 'After  : ', imsg, 'Rank: ', myrank
CALL MPI_FINALIZE(ierr)

END PROGRAM bcast
