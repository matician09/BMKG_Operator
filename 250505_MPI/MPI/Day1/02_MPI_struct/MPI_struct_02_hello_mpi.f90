program hello_mpi
   implicit none
   include 'mpif.h'
   integer :: ierr

   call mpi_init(ierr)
   write(*,*) 'hello world from mpi'
   call mpi_finalize(ierr)

end program hello_mpi