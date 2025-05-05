PROGRAM scatterv

   IMPLICIT NONE
   INCLUDE 'mpif.h'
   integer :: ierror
   integer :: size
   integer, parameter  :: root_rank=0
   integer :: my_rank
   integer, allocatable:: my_values(:)
   integer :: my_values_count
   integer :: buffer(0:6), counts(0:2), displacements(0:2), i
   
   call MPI_Init(ierror)
   call MPI_Comm_size(MPI_COMM_WORLD, size, ierror)
   call MPI_Comm_rank(MPI_COMM_WORLD, my_rank, ierror)
   
   if (size .ne. 3) then
       write(*,'(A)')  'This application is meant to be run with 3 processes'
       call MPI_Abort(MPI_COMM_WORLD, -1, ierror)
   end if
   
   select case (my_rank)
     case(0)
       my_values_count = 1
       allocate(my_values(0:my_values_count-1))
       buffer = (/100,0,101,102,0,0,103/)
       counts = (/1,2,1/)
       displacements = (/0,2,6/)
       write(*,'(A)') 'Values in the buffer of root process.'
       do i = 0, 6
           write(*,*) ' ', buffer(i)
       end do
       write(*,*) ''
    case(1)
      my_values_count = 2
      allocate(my_values(0:my_values_count-1))
    case(2)
      my_values_count = 1
      allocate(my_values(0:my_values_count-1))
   end select
   
   call MPI_Scatterv(buffer, counts, displacements, MPI_INTEGER, &
        my_values, my_values_count, MPI_INTEGER, root_rank, MPI_COMM_WORLD, ierror)
   write(*,*) 'Process ', my_rank, ' received values.'
   
   do i = 0, my_values_count-1
       write(*,*) ' ', my_values(i)
   end do
   
   write(*,*) ''
   deallocate(my_values)
   call MPI_FINALIZE(ierror)

END PROGRAM scatterv
