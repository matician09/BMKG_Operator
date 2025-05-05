PROGRAM gather
IMPLICIT NONE

INCLUDE 'mpif.h'

INTEGER :: irecv(4)
INTEGER :: ierr, nprocs, myrank, isend

CALL MPI_INIT(ierr)
CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

isend = myrank + 1

CALL MPI_GATHER(isend, 1, MPI_INTEGER, irecv, 1, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)

if (myrank == 0) then
    print*, 'irecv = ', irecv
endif

CALL MPI_FINALIZE(ierr)

END PROGRAM gather
