PROGRAM gatherv
   IMPLICIT NONE
   INCLUDE 'mpif.h'
   
   INTEGER :: isend(3), irecv(6)
   INTEGER :: ircnt(0:2), idisp(0:2)
   INTEGER :: ierr, myrank, i, iscnt
   
   DATA  ircnt/1,2,3/ idisp/0,1,3/
   
   CALL MPI_INIT(ierr)
   CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)
   
   do i = 1, myrank+1
       isend(i) = myrank + 1
   enddo
   
   iscnt = myrank + 1
   
   CALL MPI_GATHERV(isend, iscnt, MPI_INTEGER, irecv, ircnt, idisp, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)
   
   if (myrank == 0) then
       write(*,'(a,6i5)') 'irecv = ', irecv
   endif
   
   CALL MPI_FINALIZE(ierr)

END PROGRAM gatherv
