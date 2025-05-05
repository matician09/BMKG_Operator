PROGRAM allgather
  IMPLICIT NONE
  INCLUDE 'mpif.h'

  integer,allocatable,dimension(:) :: rbuf
  integer :: sbuf
  integer :: nprocs, mype
  integer :: ierr, i
  
  CALL MPI_INIT(ierr)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, mype, ierr)
  
  allocate(rbuf(0:nprocs-1))
  sbuf=mype + 1
  CALL MPI_ALLGATHER(sbuf, 1, MPI_INTEGER, rbuf, 1, MPI_INTEGER,  MPI_COMM_WORLD, ierr)
  
  write(*,*) 'mype = ', mype, 'rbuf = ', rbuf
  
  deallocate(rbuf)
  CALL MPI_FINALIZE(ierr)

END PROGRAM allgather 

