PROGRAM pi_parallel
  IMPLICIT NONE
  include 'mpif.h'

  integer :: i, n
  real*8  :: sum, step, pi, x
  real*8  :: mysum
  integer :: nprocs, mype
  integer :: status(MPI_STATUS_SIZE)
  integer :: request, ierr
  
  call mpi_init(ierr)
  call mpi_comm_size(mpi_comm_world,nprocs,ierr)
  call mpi_comm_rank(mpi_comm_world,mype,ierr)
 
  n = 1000000000
  
  step = 1.0/real(n)
  sum = 0.0
  mysum = 0.0
  
  do i = (mype+1), n, nprocs
    x = (i - 0.5)*step
    mysum = mysum + 4.0/(1.0 + x*x)
  enddo
  
  if ( mype == 0 ) then
    sum = mysum
    do i = 1, nprocs-1
      call mpi_irecv(mysum, 1, MPI_REAL8, i, 1, MPI_COMM_WORLD, request, ierr)
      call mpi_wait(request, status, ierr)
      sum = sum + mysum
    enddo  
    pi = step * sum
  else
      call mpi_isend(mysum, 1, MPI_REAL8, 0, 1, MPI_COMM_WORLD, request, ierr)
      call mpi_wait(request, status, ierr)
  endif
  
  write(*,*) 'mype=',mype,'pi=', pi
  call mpi_finalize(ierr)

END PROGRAM pi_parallel
