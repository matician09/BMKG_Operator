CC = gcc
CFLAGS = -Wall -O2
TARGET_STATIC = static_prog
TARGET_SHARED = shared_prog

all: $(TARGET_STATIC) $(TARGET_SHARED)

# Static Library
libutil.a: util.o
	ar rcs $@ $^

$(TARGET_STATIC): main.o libutil.a
	$(CC) $(CFLAGS) -o $@ main.o libutil.a

# Shared Library
libutil.so: util.c
	$(CC) -fPIC -shared -o $@ util.c

$(TARGET_SHARED): main.o libutil.so
	$(CC) $(CFLAGS) -o $@ main.o -L. -lutil -Wl,-rpath,.

main.o: main.c util.h
	$(CC) $(CFLAGS) -c main.c

util.o: util.c util.h
	$(CC) $(CFLAGS) -c util.c

clean:
	rm -f *.o *.a *.so $(TARGET_STATIC) $(TARGET_SHARED)

