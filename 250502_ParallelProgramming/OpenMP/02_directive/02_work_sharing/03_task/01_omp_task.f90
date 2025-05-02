PROGRAM TASK

      DO I=1, 9
         IF(I <= 9) NS=3
         IF(I <= 6) NS=2
         IF(I <= 3) NS=1
         PRINT*, I,'th SLEEP ', NS ,' SEC'
         CALL SLEEP(NS)
      ENDDO
      
ENDPROGRAM
