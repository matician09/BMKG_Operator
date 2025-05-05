program hello_mpi
  use mpi
  implicit none
  integer :: ierr, mype, nprocs

  call mpi_init(ierr)
  call mpi_comm_rank(mpi_comm_world, mype,   ierr)
  call mpi_comm_size(mpi_comm_world, nprocs, ierr)

  print*, 'mype=', mype, 'size=', nprocs, 'hello world 1st'
  call mpi_barrier(mpi_comm_world, ierr)
  print*, 'mype=', mype, 'size=', nprocs, 'hello world 2nd'
    
  call mpi_finalize(ierr)

end program hello_mpi
