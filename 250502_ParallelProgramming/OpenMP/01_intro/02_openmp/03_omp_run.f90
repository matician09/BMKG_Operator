program omp_run

integer :: i, j, a

 do i=1,1000
  do j=1,1000
       a=a+i+j
  enddo
 enddo

print*, a

endprogram
