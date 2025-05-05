Program f3ortran

integer i

print*, 'i ='
read*, i

if( i > 19 )then
   print*, 'i > 19'
elseif( i == 19 )then
   print*, 'i == 19'
else
   print*, 'i < 19'
endif

End Program f3ortran