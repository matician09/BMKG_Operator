program monte_carlo_pi
  implicit none
  integer :: i, pt_count, total_count
  real :: px, py, r_val, pi_estimate

  call random_seed()  ! Random Number Seed
  pt_count = 0
  total_count = 10000

  do i = 1, total_count
     call random_number(px)
     call random_number(py)
     r_val = sqrt(px**2 + py**2)
     if (r_val < 1.0) then
        pt_count = pt_count + 1
     end if
  end do

  pi_estimate = real(pt_count) / real(total_count) * 4.0
  print *, 'Estimated Pi = ', pi_estimate

end program monte_carlo_pi

