PROGRAM allgatherv
  IMPLICIT NONE

INCLUDE 'mpif.h'

integer,allocatable,dimension(:) :: mydata, alldata,displs,counts
integer :: nprocs, mype
integer :: mysize, size
integer :: ierr, i

CALL MPI_INIT(ierr)
CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
CALL MPI_COMM_RANK(MPI_COMM_WORLD, mype, ierr)

mysize = mype + 1
allocate(mydata(mysize))
mydata = mype + 1
allocate(counts(0:nprocs-1))
allocate(displs(0:nprocs-1))

call mpi_allgather(mydata(1), 1, MPI_INTEGER, counts, 1, MPI_INTEGER, MPI_COMM_WORLD, ierr)

displs(0) = 0

do i = 1, nprocs-1
  displs(i) = counts(i-1) + displs(i-1)
enddo

size = sum(counts)
allocate(alldata(size))
 
call mpi_allgatherv(mydata, mysize, MPI_INTEGER, alldata, counts, displs, MPI_INTEGER, MPI_COMM_WORLD, ierr)
write(*,'(a,i0,a,1000i3)') 'mype = ', mype, 'alldata = ', alldata
deallocate(counts, displs, alldata, mydata)

 CALL MPI_FINALIZE(ierr)

END PROGRAM allgatherv
