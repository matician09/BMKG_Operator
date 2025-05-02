PROGRAM hello
IMPLICIT NONE

integer :: s_cnt, e_cnt, crate

CALL SYSTEM_CLOCK(s_cnt, crate)

print*, 'hello world from fortran'
CALL SLEEP(10)

CALL SYSTEM_CLOCK(e_cnt, crate)

print*, real(e_cnt-s_cnt)/crate, 'sec'

ENDPROGRAM
