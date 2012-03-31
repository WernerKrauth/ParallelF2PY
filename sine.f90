module sine
use types, only: dp
implicit none
private
public sine_add_1, sine_add_2, sine_add_3

contains

subroutine sine_add_1(data)
real(dp), intent(inout) :: data
integer :: k
do k = 2, 1000000
    data = data + sin(1./k)
end do
end

subroutine sine_add_2(index, data, N)
integer, intent(in) :: N
integer, intent(in) :: index
real(dp), intent(inout) :: data(N)
integer :: k
do k = 2, 1000000
    data(index+1) = data(index+1) + sin(1./k)
end do
end

subroutine sine_add_3(index, data)
integer, intent(in) :: index
real(dp), intent(inout) :: data(:)
integer :: k
do k = 2, 1000000
    data(index+1) = data(index+1) + sin(1./k)
end do
end

end module
