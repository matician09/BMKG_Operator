PROGRAM gatherv
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  
  integer, allocatable, dimension(:) :: mydata, alldata,displs,counts
  integer     :: nprocs, mype
  integer     :: mysize, size
  integer     :: ierr, i
  
  CALL MPI_INIT(ierr)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, mype, ierr)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
  
  mysize = mype + 1
  allocate(mydata(mysize))
  mydata = mype + 1
  
  if ( mype == 0) then
    allocate(counts(0:nprocs-1))
    allocate(displs(0:nprocs-1))
  endif
  
  call mpi_gather(mysize, 1, MPI_INTEGER, counts, 1, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)
  
  if ( mype == 0) then
    displs(0) = 0
    do i = 1, nprocs-1
      displs(i) = counts(i-1) + displs(i-1)
    enddo
    size = sum(counts)
    allocate(alldata(size))
  endif
  
  call mpi_gatherv(mydata, mysize, MPI_INTEGER, alldata, counts, displs, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)
  
  if ( mype == 0) then
    write(*,*) 'mype = ', mype
    write(*,'(a,1000i5)') 'alldata = ', alldata
    deallocate(counts, displs, alldata)
  endif
  
  deallocate(mydata)
  call mpi_finalize(ierr)

END PROGRAM gatherv 
