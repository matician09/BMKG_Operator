CC = gcc
CFLAGS = -Wall -g
TARGET = my_program
OBJS = main.o util.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

main.o: main.c util.h
	$(CC) $(CFLAGS) -c main.c

util.o: util.c util.h
	$(CC) $(CFLAGS) -c util.c

clean:
	rm -f *.o $(TARGET)

