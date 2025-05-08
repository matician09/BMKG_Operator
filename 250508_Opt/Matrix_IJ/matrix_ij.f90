program memory_access
  implicit none
  integer, parameter :: N = 4096
  real(8), dimension(N, N) :: A
  real(8) :: sum
  integer :: i, j
  real(8) :: t_start, t_end

  ! Initialize matrix
  do i = 1, N
    do j = 1, N
      A(i, j) = (i + j) * 0.5d0
    end do
  end do

  ! Column-major access (cache-friendly in Fortran)
  call cpu_time(t_start)
  sum = 0.0d0
  do j = 1, N
    do i = 1, N
      sum = sum + A(i, j)
    end do
  end do
  call cpu_time(t_end)
  print *, "Column-major sum:", sum
  print *, "Column-major time:", t_end - t_start, "sec"

  ! Row-major access (cache-unfriendly in Fortran)
  call cpu_time(t_start)
  sum = 0.0d0
  do i = 1, N
    do j = 1, N
      sum = sum + A(i, j)
    end do
  end do
  call cpu_time(t_end)
  print *, "Row-major sum:", sum
  print *, "Row-major time:", t_end - t_start, "sec"

end program memory_access

