Program send_recv
  include 'mpif.h'
  integer :: nprocs, mype
  real    :: sbuf, rbuf
  integer :: status(MPI_STATUS_SIZE)
  integer :: ierr

  call mpi_init(ierr)
  call mpi_comm_size(MPI_COMM_WORLD, nprocs, ierr)
  call mpi_comm_rank(MPI_COMM_WORLD, mype, ierr)

  sbuf=0. ; rbuf=0.
  if ( mype == 0 ) sbuf=2022
  if ( mype == 1 ) call mpi_recv(rbuf, 1, MPI_REAL, 0,  55, MPI_COMM_WORLD, ierr)
  !  0   2022.000      0.0000000E+00
  print*, mype, sbuf, rbuf
  call mpi_finalize(ierr)
End program send_recv

