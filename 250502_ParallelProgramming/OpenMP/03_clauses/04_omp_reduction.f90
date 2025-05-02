program reduction
use omp_lib
integer tid
real s

!$OMP PARALLEL 
TID=OMP_GET_THREAD_NUM()
S=2.
!!!$OMP DO SCHEDULE(STATIC,1) REDUCTION(max:S)
!$OMP DO SCHEDULE(STATIC,1) REDUCTION(+:S)
DO I=1,4
   S = S+I
   print*, I, S, TID
ENDDO
!$OMP END PARALLEL

PRINT*, S

endprogram
