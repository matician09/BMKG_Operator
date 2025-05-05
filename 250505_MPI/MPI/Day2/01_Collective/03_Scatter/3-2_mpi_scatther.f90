PROGRAM scatter
    IMPLICIT NONE
    INCLUDE 'mpif.h'
    integer :: ierror
    integer :: size
    integer, parameter  :: root_rank=0
    integer :: my_rank, my_value
    integer :: buffer(0:3)

    call MPI_Init(ierror)
    call MPI_Comm_size(MPI_COMM_WORLD, size, ierror)
    
    if (size .ne. 4) then
        write(*,'(A)')  'This application is meant to be run with 4 processes'
        call MPI_Abort(MPI_COMM_WORLD, -1, ierror)
    end if
    
    call MPI_Comm_rank(MPI_COMM_WORLD, my_rank, ierror)
    
    if (my_rank .eq. root_rank) then
        buffer = (/0, 100, 200, 300/)
        write(*,'(a,i0,a,i0,a,i0,a,i0,a,i0,a)') 'Values to scatter from process', my_rank, ' : ', &
        buffer(0), ', ', buffer(1), ', ', buffer(2), ', ', buffer(3), '.'
    end if
    
    call MPI_Scatter(buffer, 1, MPI_INTEGER, my_value, 1, MPI_INTEGER, root_rank, MPI_COMM_WORLD, ierror)
    
    write(*,'(a,i0,a,i0,a)') 'Process ', my_rank, ' received value = ', my_value, '.'
    
    call MPI_FINALIZE(ierror)

END PROGRAM scatter
