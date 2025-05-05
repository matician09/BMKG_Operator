Program MatrixMultiplication
real A(4,2),B(2,3),C(4,3)

A=0.;B=0.;C=0.

do j = 1,2
do i = 1,4
   A(i,j)= 2*i+j**2
enddo
enddo

do j = 1,3
do i = 1,2
   B(i,j)= 3*i-j**2
enddo
enddo

do i = 1,4
   print*, A(i,:)
enddo

print*, ' '
do i = 1,2
   print*, B(i,:)
enddo

End Program MatrixMultiplication
