PROGRAM scatter
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  INTEGER :: isend(16)
  INTEGER :: ierr, nprocs, myrank, i, irecv(2)

  CALL MPI_INIT(ierr)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

  if (myrank == 0) then
      do i = 1, 16
          isend(i) = i
      enddo
  endif
  
  CALL MPI_SCATTER(isend, 2, MPI_INTEGER, irecv, 2, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)

  print*, 'irecv = ', irecv, 'rank =', myrank
  
  CALL MPI_FINALIZE(ierr)

END PROGRAM scatter
