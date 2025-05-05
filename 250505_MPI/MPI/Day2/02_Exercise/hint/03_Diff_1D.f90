program diff1d
    use mpi
    integer,parameter :: nrow=12
    integer :: t, ierr, mype, nprocs
    integer :: index(nrow)
    integer :: istatus(MPI_STATUS_SIZE)
    real heat(0:nrow+1), heat_new(0:nrow+1),heat_gather(0:nrow+1)

    call mpi_init(ierr)
    call mpi_comm_rank(mpi_comm_world,mype,  ierr)
    call mpi_comm_size(mpi_comm_world,nprocs,ierr)

    index = (/1,2,3,4,5,6,7,8,9,10,11,12/)

    nchunk = nrow/nprocs
    istart = nchunk*mype+1
    iend   = nchunk*(mype+1)
    print*, 'mype=',mype,'istart=',istart,'iend=',iend
    call mpi_barrier(mpi_comm_world,ierr)

    heat=0; heat_new=0.; heat(3:5)=3.0
    if(mype.eq.0) write(*,'(a,20i12)') 'Steps  ', index
    if(mype.eq.0) write(*,'(a,20f12.3)') 'Initial', heat(1:nrow)

    do t = 1,5
       do i = istart, iend
          heat_new(i)=0.25*heat(i-1)+0.5*heat(i)+0.25*heat(i+1)
       enddo
       if(nprocs.gt.1)then
          if(mype.eq.0) call mpi_send(heat_new(iend),     1, mpi_real, 1, 10, mpi_comm_world, ierr)
          if(mype.eq.0) call mpi_recv(heat_new(iend+1),   1, mpi_real, 1, 20, mpi_comm_world, istatus, ierr)
          if(mype.eq.1) call mpi_recv(heat_new(istart-1), 1, mpi_real, 0, 10, mpi_comm_world, istatus, ierr)
          if(mype.eq.1) call mpi_send(heat_new(istart),   1, mpi_real, 0, 20, mpi_comm_world, ierr)
       endif
       heat=heat_new
       call mpi_gather(heat(istart), nchunk, mpi_real, heat_gather(1), nchunk, mpi_real, 0, mpi_comm_world, ierr)
       if(mype.eq.0) write(*,'(a,i0,20f12.3)') 'Step= ',t,heat_gather(1:nrow)
    enddo

    call mpi_finalize(ierr)

endprogram    
