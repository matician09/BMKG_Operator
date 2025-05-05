PROGRAM allgather
  IMPLICIT NONE
  INCLUDE 'mpif.h'

  INTEGER :: irecv(3)
  INTEGER :: ierr, nprocs, myrank, isend, i
  
  CALL MPI_INIT(ierr)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)
  
  isend = myrank + 1
  
  CALL MPI_ALLGATHER(isend, 1, MPI_INTEGER, irecv, 1, MPI_INTEGER, MPI_COMM_WORLD, ierr)
  
  print*, 'irecv = ', irecv
  
  CALL MPI_FINALIZE(ierr)

END PROGRAM allgather
