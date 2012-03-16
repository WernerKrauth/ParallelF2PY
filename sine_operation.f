cc=======+=========+=========+=========+=========+=========+=========+==
cc PROGRAM : event_chain.f
cc TYPE    : Fortran 77 program 
cc PURPOSE : Event-chain simulation for 4 particles in a square box
cc           this program creates a python module 
cc COMMENT : 
cc VERSION : 23 FEB 2012
cc=======+=========+=========+=========+=========+=========+=========+==
      subroutine sine_add_1(data)
      real*8 data
Cf2py intent (in,out) data
      do k = 2, 100000
         data = data + sin(1./k)
      end do
      end
      subroutine sine_add_2(data,index)
      real*8 data(10)
Cf2py intent (in,out) data
      do k = 2, 100000
         data(index+1) = data(index+1) + sin(1./k)
      end do
      end
