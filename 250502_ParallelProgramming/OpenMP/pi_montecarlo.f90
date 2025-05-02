PROGRAM Pi_monte

IMPLICIT NONE

integer(kind=8), parameter      :: num_cnt=100000000
integer(kind=8)                 :: i, cnt
double precision                :: pi, x, y, r

  WRITE(*,200)

  pi = 0.0d0; cnt = 0; r = 0.0d0;

  DO i=0, num_cnt-1
    CALL random_number(x)
    CALL random_number(y)
    r = sqrt(x*x + y*y)

    IF (r <= 1) THEN
      cnt = cnt + 1
    ENDIF
  ENDDO

  pi = 4.0d0 * dble(cnt) / dble(num_cnt)

  WRITE(*, 100) pi, dabs(dacos(-1.0d0)-pi)
  WRITE(*, 200)

100 FORMAT("PI = ", F17.15, " (Error = ", E12.3,")")
200 FORMAT("--------------------------------------------------------")

END PROGRAM
