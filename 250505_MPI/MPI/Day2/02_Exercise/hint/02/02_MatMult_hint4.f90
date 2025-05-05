program matmul
   use mpi
   implicit none
  
   integer i,j,k
   integer,parameter :: n=4
   real A(n,n), Bt(n,n), C(n,n), D(n,n)
   real A1(n),  Bt1(n),  C1(n)
   integer ierr, mype, nprocs

   call mpi_init(ierr)
   call mpi_comm_rank(mpi_comm_world,mype,ierr)
   call mpi_comm_size(mpi_comm_world,nprocs,ierr)

   call seed(2020)
   do j = 1,n
   do i = 1,n
      call random_number(A(i,j))
      call random_number(Bt(i,j))
   enddo
   enddo
   
   do j = 1,n
   do k = 1,n
       C((mype+1),j) = C((mype+1),j) + A((mype+1),k)*Bt(j,k)
   enddo
   enddo

   call MPI_REDUCE(C, D, n*n, MPI_REAL, MPI_SUM, 0, MPI_COMM_WORLD, ierr)
  
   if(mype.eq.0)then
   do i = 1,n
      write(*,'(4f12.5)') D(i,:)
   enddo
   write(*,*) 'Sum of C =', sum(D), mype
   endif

end program matmul

