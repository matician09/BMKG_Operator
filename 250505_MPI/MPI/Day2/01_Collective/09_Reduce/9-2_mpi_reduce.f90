PROGRAM pi_parallel
  IMPLICIT NONE
  include 'mpif.h'
  integer :: i, n
  real*8  :: tsum, step, pi, x
  real*8  :: mysum
  integer :: nprocs, mype
  integer :: ierr
  
  CALL MPI_INIT(ierr)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, mype, ierr)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
  
  n = 1000000000
  step = 1.0/n
  tsum = 0.0
  mysum = 0.0
  
  do i = mype+1, n, nprocs
    x = (i - 0.5)*step
    mysum = mysum + 4.0/(1.0 + x*x)
  enddo
  
  call mpi_reduce(mysum, tsum, 1, MPI_REAL8, MPI_SUM, 0, MPI_COMM_WORLD, ierr)
  
  if ( mype == 0 ) then
    pi = step * tsum
    write(*,*) 'mype = ', mype, 'pi = ', pi
  endif
  
  CALL MPI_FINALIZE(ierr)

END PROGRAM pi_parallel
