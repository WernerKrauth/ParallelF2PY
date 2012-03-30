from psine import sine_add_3
from numpy import empty

data = empty(5)
data[:] = -1
print "data before:", data
sine_add_3(2, data)
print "data after:", data
