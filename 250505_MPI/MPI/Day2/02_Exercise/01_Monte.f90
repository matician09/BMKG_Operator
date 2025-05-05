program monte_pi
   implicit none
  
   integer i,j
   integer niter
   real*4 count
   real*4 x,y,pi,z
  
   !call seed(2020)
  
   niter = 200000
   count =0
   do i=1,niter
      call random_number(x)
      call random_number(y)
      z = x*x +y*y
      if (z .le. 1.) count = count + 1.
   end do
   pi= count/real(niter)*4.
   write(*,*) niter,pi

end program monte_pi

