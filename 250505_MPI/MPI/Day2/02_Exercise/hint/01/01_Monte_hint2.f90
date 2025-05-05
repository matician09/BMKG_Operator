program monte_pi
   use mpi
   implicit none
  
   integer i,j
   integer niter
   real*4 count
   real*4 x,y,pi,z
   integer mype, nprocs, ierr
   
   call mpi_init(ierr)
   call mpi_comm_rank(mpi_comm_world,mype,ierr)
   call mpi_comm_size(mpi_comm_world,nprocs,ierr)
   
   !call seed(2020)
  
   niter = 200000
   count =0
   do i=(mype+1),niter,nprocs
      call random_number(x)
      call random_number(y)
      z = x*x +y*y
      if (z .le. 1.) count = count + 1.
   end do
   pi= count/real(niter)*4.
   write(*,*) niter,pi,mype
   call mpi_finalize(ierr)

end program monte_pi

