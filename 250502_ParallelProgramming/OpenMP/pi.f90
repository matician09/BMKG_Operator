PROGRAM Pi_monte_serial_random_parallel_compute
  USE omp_lib
  IMPLICIT NONE

  integer(kind=8), parameter :: num_cnt = 100000000
  integer(kind=8)            :: i, cnt
  double precision           :: pi, r, t1, t2
  double precision, allocatable :: x(:), y(:)

  allocate(x(num_cnt), y(num_cnt))

  !-------------------------------
  ! STEP 1: Serial Random
  !-------------------------------
  print *, 'Generating random numbers (serial)...'
  call cpu_time(t1)
  do i = 1, num_cnt
     call random_number(x(i))
     call random_number(y(i))
  end do
  call cpu_time(t2)
  print *, 'Time for random number generation:', t2 - t1, 'seconds'

  !-------------------------------
  ! STEP 2: Parallel
  !-------------------------------
  print *, 'Starting parallel computation...'
  cnt = 0
  t1 = omp_get_wtime()

!$OMP PARALLEL DO PRIVATE(r) REDUCTION(+:cnt)
  do i = 1, num_cnt
     r = sqrt(x(i)**2 + y(i)**2)
     if (r <= 1.0d0) cnt = cnt + 1
  end do
!$OMP END PARALLEL DO

  t2 = omp_get_wtime()

  pi = 4.0d0 * dble(cnt) / dble(num_cnt)

  write(*,'(A,F17.15,A,E12.3,A)') 'PI = ', pi, ' (Error = ', dabs(dacos(-1.0d0) - pi), ')'
  print *, 'Time for parallel computation:', t2 - t1, 'seconds'

  deallocate(x, y)
END PROGRAM Pi_monte_serial_random_parallel_compute

