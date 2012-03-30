F90 = gfortran
F90FLAGS = -Wall -Wextra -Wimplicit-interface -fPIC -Werror -fmax-errors=1 -g -fbounds-check -fcheck-array-temporaries -fbacktrace

all: sine_module.so test_sine csine.a psine.so

sine_module.so: sine_operation.f
	f2py2.7 -c -m sine_module sine_operation.f -DF2PY_REPORT_ON_ARRAY_COPY=1

%.o: %.f90
	$(F90) $(F90FLAGS) -c $<

test_sine: test_sine.o sine.o types.o
	$(F90) -o $@ $^

csine.a: csine.o sine.o types.o
	ar rcs $@ $^

# Modify the paths to Python and NumPy here:
psine.so: csine.a psine.pyx
	cython psine.pyx
	gcc -fPIC -I$(SPKG_LOCAL)/include/python2.6 -I$(SPKG_LOCAL)/lib/python2.6/site-packages/numpy/core/include -o psine.o -c psine.c
	gfortran -shared -o psine.so psine.o csine.a

# Dependencies:
test_sine.o: sine.o types.o
sine.o: types.o
