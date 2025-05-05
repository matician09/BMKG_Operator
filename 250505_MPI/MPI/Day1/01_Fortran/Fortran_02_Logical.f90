Program f2ortran

logical T, F

T=.true.
F=.false.

print*, '3==4', 3==4
print*, '3/=4', 3/=4
print*, '3> 4', 3> 4
print*, '3>=4', 3>=4
print*, '3< 4', 3 <4
print*, '3<=4', 3<=4
print*, ' '
print*, 'T.or.T', (T.or.T)
print*, 'T.or.F', (T.or.F)
print*, 'F.or.T', (F.or.T)
print*, 'F.or.F', (F.or.F)
print*, ' '
print*, 'T.and.T', (T.and.T)
print*, 'T.and.F', (T.and.F)
print*, 'F.and.T', (F.and.T)
print*, 'F.and.F', (F.and.F)
print*, ' '
print*, 'T.xor.T', (T.xor.T)
print*, 'T.xor.F', (T.xor.F)
print*, 'F.xor.T', (F.xor.T)
print*, 'F.xor.F', (F.xor.F)

End Program f2ortran