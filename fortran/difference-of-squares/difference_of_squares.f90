module difference_of_squares
   implicit none
contains

   integer function square_of_sum(n)
      integer :: n

      square_of_sum = (n * (n + 1) / 2)**2
   end function square_of_sum

   integer function sum_of_squares(n)
      integer :: n

      sum_of_squares = n * (n + 1) * (2 * n + 1) / 6
   end function sum_of_squares

   integer function difference(n)
      integer :: n

      difference = square_of_sum(n) - sum_of_squares(n)
   end function difference

end module difference_of_squares
