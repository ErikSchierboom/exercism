

program leap_test_main
  use TesterMain
  use leap
  implicit none

  ! Test 1: year not divisible by 4 in common year
  call assert_equal(.false., is_leap_year(2015),"year not divisible by 4 in common year")
  ! Test 2: year divisible by 2, not divisible by 4 in common year
  call assert_equal(.false., is_leap_year(1970), "year divisible by 2, not divisible by 4 in common year")
  ! Test 3: year divisible by 4, not divisible by 100 in leap year
  call assert_equal(.true., is_leap_year(1996), "year divisible by 4, not divisible by 100 in leap year")
  ! Test 4: year divisible by 4 and 5 is still a leap year
  call assert_equal(.true., is_leap_year(1960), "year divisible by 4 and 5 is still a leap year")
  ! Test 5: year divisible by 100, not divisible by 400 in common year
  call assert_equal(.false., is_leap_year(2100), "year divisible by 100, not divisible by 400 in common year")
  ! Test 6: year divisible by 100 but not by 3 is still not a leap year
  call assert_equal(.false., is_leap_year(1900), "year divisible by 100 but not by 3 is still not a leap year")
  ! Test 7: year divisible by 400 is leap year
  call assert_equal(.true., is_leap_year(2000), "year divisible by 400 is leap year")
  ! Test 8: year divisible by 400 but not by 125 is still a leap year
  call assert_equal(.true., is_leap_year(2400), "year divisible by 400 but not by 125 is still a leap year")
  ! Test 9: year divisible by 200, not divisible by 400 in common year
  call assert_equal(.false., is_leap_year(1800), "year divisible by 200, not divisible by 400 in common year")

  call test_report()

end program

