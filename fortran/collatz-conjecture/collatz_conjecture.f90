
module collatz_conjecture
   implicit none
contains

   integer function steps(i)
      integer, intent(in) :: i
      integer :: current

      if (i < 1) then
         steps = -1
         return
      end if

      steps = 0
      current = i

      do while (current /= 1)
         if (mod(current, 2) == 0) then
            current = current / 2
         else
            current = current * 3 + 1
         end if

         steps = steps + 1
      end do
   end function

end module
