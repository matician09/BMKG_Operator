PROGRAM alltoall
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  
  integer,allocatable,dimension(:) :: scounts, rcounts
  integer :: nprocs, mype
  integer :: ierr, i
  
  CALL MPI_INIT(ierr)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, mype, ierr)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
  
  allocate(scounts(0:nprocs-1))
  allocate(rcounts(0:nprocs-1))
  
  do i = 0, nprocs - 1
    scounts(i) = i
  enddo
    
  write(*,*) 'mype=', mype, 'scounts=', scounts
  
  call mpi_alltoall(scounts, 1, MPI_INTEGER, rcounts, 1, MPI_INTEGER,  MPI_COMM_WORLD, ierr)
  write(*,*) 'mype=', mype, 'rcounts', rcounts
  
  deallocate(scounts, rcounts)
  CALL MPI_FINALIZE(ierr)

END PROGRAM alltoall
