PROGRAM pi_parallel
  IMPLICIT NONE

INCLUDE 'mpif.h'

integer     :: i, n
real*8      :: tsum, step, pi, x
real*8      :: mysum
integer     :: nprocs, mype
real*8,allocatable,dimension(:) :: asum
integer     :: ierr

CALL MPI_INIT(ierr)
CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
CALL MPI_COMM_RANK(MPI_COMM_WORLD, mype, ierr)

allocate(asum(0:nprocs-1))
n = 1000000000
step = 1.0/real(n)
tsum = 0.0
mysum = 0.0

do i = (mype+1), n, nprocs
  x = (i - 0.5)*step
  mysum = mysum + 4.0/(1.0 + x*x)
enddo

print*, 'rank = ', mype, 'mysum = ', mysum
call mpi_gather(mysum, 1, MPI_REAL8, asum, 1, MPI_REAL8, 0, MPI_COMM_WORLD, ierr)

if ( mype == 0 ) then
  tsum = sum(asum)
  write(*,'(a,16f20.4)') 'asum', asum
  pi = step * tsum
  print*, asum
  write(*,*) 'mype = ', mype,'pi = ', pi
endif

CALL MPI_BARRIER(MPI_COMM_WORLD,ierr)
CALL MPI_FINALIZE(ierr)

END PROGRAM pi_parallel
