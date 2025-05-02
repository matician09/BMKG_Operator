program hello_mpi
   implicit none
   include 'mpif.h'
   integer :: ierr, mype, nprocs

   call mpi_init(ierr)
   call mpi_comm_rank(MPI_COMM_WORLD, mype,   ierr)
   call mpi_comm_size(MPI_COMM_WORLD, nprocs, ierr)
   write(*,*) 'mype=', mype, 'size=', nprocs, 'hello world'
   call mpi_finalize(ierr)

end program hello_mpi