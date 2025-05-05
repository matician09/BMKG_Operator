PROGRAM scatter
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  INTEGER,ALLOCATABLE :: isend(:)
  INTEGER :: ierr, nprocs, myrank, i, irecv(4)

  CALL MPI_INIT(ierr)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

  if (myrank == 0) then
      allocate(isend(16))
      do i = 1, 16
          isend(i) = i
      enddo
  endif
  
  CALL MPI_SCATTER(isend, 4, MPI_INTEGER, irecv, 4, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)
  
  print*, 'irecv = ', irecv, 'rank =', myrank
  
  CALL MPI_FINALIZE(ierr)

END PROGRAM scatter
