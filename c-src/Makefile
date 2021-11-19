CC            = gcc
#CFLAGS       = -O1 -I /usr/irissys/dev/iris-callin/include
CFLAGS        = -g3 -ggdb -O3 -I /usr/irissys/dev/iris-callin/include
LDFLAGS       = -L/usr/irissys/bin -Wl,-rpath,/usr/irissys/bin
LIBS          = -lirisdb
LIBSMT        = -lirisdbt
PROGRAM       = callout.so 

all:            $(PROGRAM)

callout.so:	callout.o
	$(CC) callout.o -shared -o callout.so

callout.o:	callout.c
	$(CC) callout.c $(CFLAGS) -c -fPIC -o callout.o

clean:
	rm -f *.o *~ $(PROGRAM)
