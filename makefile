# Raman COMPILATION MAKEFILE
#
# Vinicius Vaz da Cruz
#

PROG=raman
CC=gcc
FC=ifort -nofor_main
#FC=gfortran
#ifort flags
FFLAGS=-traceback -fast
#gfortran flags
#FFLAGS=-O3
CFLAGS=-O3 

all: main

main: src/main.o src/rdinput.o src/readallspl.o src/splinesurf.o src/fourier.o
	$(FC) $(FFLAGS) -o $(PROG) src/main.o src/rdinput.o src/readallspl.o src/splinesurf.o src/fourier.o -lfftw3 -lgsl -lgslcblas

main.o: src/main.c
	$(CC) $(CFLAGS) -c src/main.c

rdinput.o: src/rdinput.c
	$(CC) $(CFLAGS) -c src/rdinput.c

splinesurf.o: src/splinesurf.f src/splinesurf.h
	$(FC) $(FFLAGS) -c src/splinesurf.f

fourier.o: src/fourier.c src/fourier.h
	$(CC) $(CFLAGS) -c src/fourier.c -lfftw3 -lm

clean:
	rm *~ src/*~ src/*.o
