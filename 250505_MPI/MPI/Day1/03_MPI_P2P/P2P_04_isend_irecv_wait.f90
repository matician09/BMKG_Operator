PROGRAM isend
  INCLUDE 'mpif.h'
  INTEGER err, rank, count, req
  REAL data(100), value(200)
  INTEGER status(MPI_STATUS_SIZE)
  CALL MPI_INIT(err)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD,rank,err)
  IF (rank.eq.1) THEN
    data=3.0
    CALL MPI_ISEND(data,100,MPI_REAL,0,55,MPI_COMM_WORLD,req, err)
    CALL MPI_WAIT(req, status, err)
  ELSE IF(rank.eq.0) THEN
    value=0.0
    CALL MPI_IRECV(value,200,MPI_REAL,1,55,MPI_COMM_WORLD,req,err)
    CALL MPI_WAIT(req, status, err)
    PRINT *, "P:",rank," Sum of value:",sum(value)
  ENDIF
  CALL MPI_FINALIZE(err)
  END
  
