module csine
use iso_c_binding, only: c_int, c_double
use sine, only: sine_add_3
implicit none
private

contains

subroutine c_sine_add_3(index, n, data) bind(c)
integer(c_int), intent(in) :: index, n
real(c_double), intent(inout) :: data(n)
call sine_add_3(index, data)
end module

end module
