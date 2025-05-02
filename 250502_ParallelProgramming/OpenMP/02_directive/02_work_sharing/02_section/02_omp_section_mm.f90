PROGRAM MATMULT

INTEGER  NRA, NCA, NCB, TID, NTHREADS, I, J, K, CHUNK
INTEGER OMP_GET_NUM_THREADS, OMP_GET_THREAD_NUM
PARAMETER (NRA=6200)
PARAMETER (NCA=1500)
PARAMETER (NCB=700)
REAL*8 A(NRA,NCA), B(NCA,NCB), C(NRA,NCB)


!$OMP PARALLEL SHARED(A,B,C,NTHREADS) PRIVATE(TID,I,J,K)
      TID = OMP_GET_THREAD_NUM()
      IF (TID .EQ. 0) THEN
        NTHREADS = OMP_GET_NUM_THREADS()
        PRINT *, 'Starting matrix multiple with', NTHREADS,'threads'
      END IF

!     Initialize matrices
!$OMP SECTIONS
!$OMP SECTION
      PRINT*, 'SECTION #1', OMP_GET_THREAD_NUM()
      DO I=1, NRA
      DO J=1, NCA
          A(I,J) = (I-1)+(J-1)
      ENDDO
      ENDDO

!$OMP SECTION
      PRINT*, 'SECTION #2', OMP_GET_THREAD_NUM()
      DO I=1, NCA
      DO J=1, NCB
          B(I,J) = (I-1)*(J-1)
      ENDDO
      ENDDO
      
!$OMP SECTION
      PRINT*, 'SECTION #3', OMP_GET_THREAD_NUM()
      DO I=1, NRA
      DO J=1, NCB
          C(I,J) = 0
      ENDDO
      ENDDO

!$OMP SECTION
      PRINT*, 'SECTION #4', OMP_GET_THREAD_NUM()
      DO I=1, NRA
      DO J=1, NCB
      DO K=1, NCA
            C(I,J) = C(I,J) + A(I,K) * B(K,J)
      ENDDO
      ENDDO
      ENDDO
!$OMP END SECTIONS
!$OMP END PARALLEL

      print*, SUM(C)

ENDPROGRAM
