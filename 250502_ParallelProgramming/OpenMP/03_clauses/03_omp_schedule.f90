PROGRAM TASK

      INTEGER TID, OMP_GET_THREAD_NUM

!$OMP PARALLEL PRIVATE(TID) NUM_THREADS(3)
      TID = OMP_GET_THREAD_NUM()

!$OMP SINGLE
      PRINT*, '#1 DEFUALT'
!$OMP END SINGLE
!$OMP DO
      DO I=1, 9
         PRINT*, '#1 DEFAULT Thread ',TID, 'is running number ',I
      ENDDO

!$OMP SINGLE
      PRINT*, '#2 STATIC CHUNK 2'
!$OMP END SINGLE
!$OMP DO SCHEDULE(STATIC,2) 
      DO I=1, 9
         PRINT*, '#2 STATIC Thread ',TID, 'is running number ',I
      ENDDO

!$OMP SINGLE
      PRINT*, '#3 DYNAMIC CHUNK 2'
!$OMP END SINGLE
!$OMP DO SCHEDULE(DYNAMIC,2)
      DO I=1, 9
         PRINT*, '#3 DYNAMIC Thread ',TID, 'is running number ',I
      ENDDO

!$OMP SINGLE
      PRINT*, '#4 STATIC CHUNK 1'
!$OMP END SINGLE
!$OMP DO SCHEDULE(STATIC,1)
      DO I=1, 9
         PRINT*, '#4 STATIC Thread ',TID, 'is running number ',I
      ENDDO

!$OMP SINGLE
      PRINT*, '#5 DYNAMIC CHUNK 1'
!$OMP END SINGLE
!$OMP DO SCHEDULE(DYNAMIC,1)
      DO I=1, 9
         PRINT*, '#5 STATIC Thread ',TID, 'is running number ',I
      ENDDO

!$OMP END PARALLEL
      
END
