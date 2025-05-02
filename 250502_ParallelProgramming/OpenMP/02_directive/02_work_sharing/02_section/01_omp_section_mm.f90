PROGRAM MATMULT

INTEGER  NRA, NCA, NCB, TID, NTHREADS, I, J, K, CHUNK
PARAMETER (NRA=6200)
PARAMETER (NCA=1500)
PARAMETER (NCB=700)
REAL*8 A(NRA,NCA), B(NCA,NCB), C(NRA,NCB)

!     Initialize matrices
      DO I=1, NRA
      DO J=1, NCA
          A(I,J) = (I-1)+(J-1)
      ENDDO
      ENDDO

      DO I=1, NCA
      DO J=1, NCB
          B(I,J) = (I-1)*(J-1)
      ENDDO
      ENDDO
      
      DO I=1, NRA
      DO J=1, NCB
          C(I,J) = 0
      ENDDO
      ENDDO

      DO I=1, NRA
      DO J=1, NCB
      DO K=1, NCA
            C(I,J) = C(I,J) + A(I,K) * B(K,J)
      ENDDO
      ENDDO
      ENDDO

      print*, SUM(C)

ENDPROGRAM
