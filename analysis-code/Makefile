#------------------------------------------------------------------------------
#
#
#
#
#------------------------------------------------------------------------------
CC = gcc
CFLAGS = -g -Wall
PRG = smain

$(PRG) : simple_main.o
		$(CC) $(CFLAGS) -o $(PRG) simple_main.o

simple_main.o : simple_main.c
		$(CC) $(CFLAGS) -c simple_main.c

clean :
		rm simple_main.o $(PRG)

all : $(PRG)

generate : all

