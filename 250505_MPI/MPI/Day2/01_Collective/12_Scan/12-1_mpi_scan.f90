PROGRAM SCAN
  IMPLICIT NONE
  INCLUDE 'mpif.h'
    
  integer :: sdata, rdata
  integer :: nprocs, mype
  integer :: ierr
  
  call mpi_init(ierr)
  call mpi_comm_size(MPI_COMM_WORLD, nprocs, ierr)
  call mpi_comm_rank(MPI_COMM_WORLD, mype, ierr)
  
  sdata = mype+1
  call mpi_scan(sdata, rdata, 1, MPI_INTEGER, MPI_SUM, MPI_COMM_WORLD, ierr)
  write(*,*) 'mype = ', mype, 'sdata = ', sdata, 'rdata = ', rdata
  
  CALL MPI_FINALIZE(ierr)

END PROGRAM scan
