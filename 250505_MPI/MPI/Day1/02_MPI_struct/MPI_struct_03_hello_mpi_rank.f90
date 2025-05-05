program hello_mpi
   implicit none
   include 'mpif.h'
   integer :: ierr, mype

   call mpi_init(ierr)
   call mpi_comm_rank(MPI_COMM_WORLD, mype, ierr)
   write(*,*) 'hello world from mpi rank', mype
   call mpi_finalize(ierr)

end program hello_mpi