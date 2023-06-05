
! This test was created from E:\nosave\code\gitrepos\pclausen\problem-specifications\exercises\collatz-conjecture\canonical-data.json
! version: None
!

program collatz_conjecture_test_main
   use TesterMain
   use collatz_conjecture
   implicit none

   ! Test 1: zero steps for one
   ! UUID 1: 540a3d51-e7a6-47a5-92a3-4ad1838f0bfd
   call assert_equal(0, steps(1), "zero steps for one")
   ! Test 2: divide if even
   ! UUID 2: 3d76a0a6-ea84-444a-821a-f7857c2c1859
   call assert_equal(4, steps(16), "divide if even")
   ! Test 3: even and odd steps
   ! UUID 3: 754dea81-123c-429e-b8bc-db20b05a87b9
   call assert_equal(9, steps(12), "even and odd steps")
   ! Test 4: large number of even and odd steps
   ! UUID 4: ecfd0210-6f85-44f6-8280-f65534892ff6
   call assert_equal(152, steps(1000000), "large number of even and odd steps")
   ! Test 5: zero is an error
   ! UUID 5: 7d4750e6-def9-4b86-aec7-9f7eb44f95a3
   ! ERROR: Only positive numbers are allowed
   call assert_equal(-1, steps(0), "zero is an error")
   ! Test 6: negative value is an error
   ! UUID 6: c6c795bf-a288-45e9-86a1-841359ad426d
   ! ERROR: Only positive numbers are allowed
   call assert_equal(-1, steps(-15), "negative value is an error")

   call test_report()

end program

