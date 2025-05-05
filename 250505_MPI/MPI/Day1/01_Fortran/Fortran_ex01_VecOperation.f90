Program VectorOperation

real A(16),B(16),C(16),D(16),E

A=0.;B=0.;C=0.;D=0.;E=0.

do i = 1,16
   A(i)=3*mod(2*i,5)**(mod(i,3))
   B(i)=2*mod(i,7)
enddo

do i = 1,16
!######## Make C ######
   C(i)=3*A(i)+2*B(i)
!######## Make D ######
   if (A(i)**2 >= B(i)**(-1)) then
      D(i)=A(i)**2
   else
      D(i)=B(i)**(-1)
   endif
enddo

!######## Calculate E ######
E = 0
do i = 1,16
   E = E + C(i)
enddo

write(*,'(16f8.2)') A(1:6)
write(*,'(16f8.2)') B(1:6) 
write(*,'(16f8.2)') C(1:6)
write(*,'(16f8.2)') D(1:6) 
write(*,'(16f8.2)') E

End Program VectorOperation
