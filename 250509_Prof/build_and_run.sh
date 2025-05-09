gcc -pg -o sample.o ./sample.c

./sample.o

gprof sample.o gmon.out
