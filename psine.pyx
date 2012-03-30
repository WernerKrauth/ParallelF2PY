from numpy cimport ndarray

cdef extern:
    void c_sine_add_3(int *index, int *n, double *data)

def sine_add_3(int index, ndarray[double, mode="c"] data):
    cdef int n = len(data)
    c_sine_add_3(&index, &n, &data[0])
