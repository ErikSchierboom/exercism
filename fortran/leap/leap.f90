module leap
   implicit none

contains

   logical function is_leap_year(year)
      integer :: year

      is_leap_year = mod(year, 4) == 0 .and. (mod(year, 100) /= 0 .or. mod(year, 400) == 0)
   end function

end module

