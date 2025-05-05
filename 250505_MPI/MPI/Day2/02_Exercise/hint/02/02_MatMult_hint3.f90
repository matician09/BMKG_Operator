program matmul
   use mpi
   implicit none
  
   integer i,j,k
   integer,parameter :: n=4
   real A(n,n), Bt(n,n), C(n,n)
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
   
   call mpi_scatter(A,   4, MPI_REAL,  A1, 4, MPI_REAL, 0, MPI_COMM_WORLD, ierr)
   call mpi_barrier(mpi_comm_world,ierr)

   do j = 1,n
   do k = 1,n
       C1(j) = C1(j) + A1(k)*Bt(j,k)
   enddo
   enddo

   call mpi_gather (C1, 4, MPI_REAL, C,  4, MPI_REAL, 0, MPI_COMM_WORLD, ierr)
   call mpi_barrier(mpi_comm_world,ierr)
  
   if(mype.eq.0)then
   do i = 1,n
      write(*,'(4f12.5)') C(i,:)
   enddo
   write(*,*) 'Sum of C =', sum(C), mype
   endif

end program matmul

