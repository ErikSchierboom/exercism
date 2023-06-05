
! This test was created from ../../exercism/problem-specifications/exercises/raindrops/canonical-data.json
! version: 1.1.0
!

program raindrops_test_main
   use TesterMain
   use raindrops
   implicit none

   ! Test 1: the sound for 1 is 1
   call assert_equal("1", convert(1), "the sound for 1 is 1")
   ! Test 2: the sound for 3 is Pling
   call assert_equal("Pling", convert(3), "the sound for 3 is Pling")
   ! Test 3: the sound for 5 is Plang
   call assert_equal("Plang", convert(5), "the sound for 5 is Plang")
   ! Test 4: the sound for 7 is Plong
   call assert_equal("Plong", convert(7), "the sound for 7 is Plong")
   ! Test 5: the sound for 6 is Pling as it has a factor 3
   call assert_equal("Pling", convert(6), "the sound for 6 is Pling as it has a factor 3")
   ! Test 6: 2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base
   call assert_equal("8", convert(8), "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base")
   ! Test 7: the sound for 9 is Pling as it has a factor 3
   call assert_equal("Pling", convert(9), "the sound for 9 is Pling as it has a factor 3")
   ! Test 8: the sound for 10 is Plang as it has a factor 5
   call assert_equal("Plang", convert(10), "the sound for 10 is Plang as it has a factor 5")
   ! Test 9: the sound for 14 is Plong as it has a factor of 7
   call assert_equal("Plong", convert(14), "the sound for 14 is Plong as it has a factor of 7")
   ! Test 10: the sound for 15 is PlingPlang as it has factors 3 and 5
   call assert_equal("PlingPlang", convert(15), "the sound for 15 is PlingPlang as it has factors 3 and 5")
   ! Test 11: the sound for 21 is PlingPlong as it has factors 3 and 7
   call assert_equal("PlingPlong", convert(21), "the sound for 21 is PlingPlong as it has factors 3 and 7")
   ! Test 12: the sound for 25 is Plang as it has a factor 5
   call assert_equal("Plang", convert(25), "the sound for 25 is Plang as it has a factor 5")
   ! Test 13: the sound for 27 is Pling as it has a factor 3
   call assert_equal("Pling", convert(27), "the sound for 27 is Pling as it has a factor 3")
   ! Test 14: the sound for 35 is PlangPlong as it has factors 5 and 7
   call assert_equal("PlangPlong", convert(35), "the sound for 35 is PlangPlong as it has factors 5 and 7")
   ! Test 15: the sound for 49 is Plong as it has a factor 7
   call assert_equal("Plong", convert(49), "the sound for 49 is Plong as it has a factor 7")
   ! Test 16: the sound for 52 is 52
   call assert_equal("52", convert(52), "the sound for 52 is 52")
   ! Test 17: the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7
   call assert_equal("PlingPlangPlong", convert(105), "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7")
   ! Test 18: the sound for 3125 is Plang as it has a factor 5
   call assert_equal("Plang", convert(3125), "the sound for 3125 is Plang as it has a factor 5")

   call test_report()

end program

