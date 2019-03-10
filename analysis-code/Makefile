#------------------------------------------------------------------------------
#
#
#
#
#------------------------------------------------------------------------------
CC = gcc
CFLAGS = -g -Wall
PRG = smain
PRGSTRIPED = smain-stripped
SIMLIB = simple_lib.o
BADLIB = bad_lib.o
STRIP = strip


$(PRG) : simple_main.o
		$(CC) $(CFLAGS) -o $(PRG) simple_main.o

simple_main.o : simple_main.c
		$(CC) $(CFLAGS) -c simple_main.c

$(SIMLIB) : simple_lib.c
		$(CC) $(CFLAGS) -c simple_lib.c

$(BADLIB) : bad_lib.c
		$(CC) $(CFLAGS) -c bad_lib.c


$(PRGSTRIPED):
		$(STRIP) -s -o $(PRGSTRIPED) $(PRG)

clean :
		rm simple_main.o $(PRG) $(PRGSTRIPED) $(SIMLIB) $(BADLIB)
		./binary_analysis.sh -c

all : $(PRG) $(PRGSTRIPED) $(SIMLIB) $(BADLIB)

generate : all
	./binary_analysis.sh -e $(PRG)
	./binary_analysis.sh -e $(PRGSTRIPED)
	./binary_analysis.sh -e $(SIMLIB)
	./binary_analysis.sh -e $(BADLIB)

