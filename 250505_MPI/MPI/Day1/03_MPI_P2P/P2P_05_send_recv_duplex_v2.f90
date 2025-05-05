Program send_recv
  include 'mpif.h'
  integer,parameter :: n=35000
  integer :: nprocs, mype
  real    :: buf_0(n), buf_1(n)
  integer :: status(MPI_STATUS_SIZE)
  integer :: ierr

  call mpi_init(ierr)
  call mpi_comm_size(MPI_COMM_WORLD, nprocs, ierr)
  call mpi_comm_rank(MPI_COMM_WORLD, mype,   ierr)

  buf_0=0. ; buf_1=0.
  if ( mype == 0 ) then
     buf_0=2022
     call mpi_send(buf_0, n, MPI_REAL, 1,  55, MPI_COMM_WORLD,         ierr)
     call mpi_recv(buf_1, n, MPI_REAL, 1,  65, MPI_COMM_WORLD, status, ierr)
  else if ( mype == 1) then
     buf_1=2032
     call mpi_send(buf_1, n, MPI_REAL, 0,  65, MPI_COMM_WORLD,         ierr)
     call mpi_recv(buf_0, n, MPI_REAL, 0,  55, MPI_COMM_WORLD, status, ierr)
  endif
  print*, mype, buf_0(1), buf_1(1)
  call mpi_finalize(ierr)

End program send_recv

