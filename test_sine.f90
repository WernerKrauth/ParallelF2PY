program test_sine
use types, only: dp
use sine, only: sine_add_3
implicit none

real(dp) :: data(5)

print *, "Testing sine_add_3"
data = -1
data(3) = 0
print *, "data before:", data
call sine_add_3(2, data)
print *, "data after:", data

end program
