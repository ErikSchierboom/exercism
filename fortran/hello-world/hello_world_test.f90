! This test was created from ..\..\exercism\problem-specifications\exercises\hello-world\canonical-data.json
! version: 1.1.0
!
! This is the main test program to test your implementaion which is done in
!   hello_world.f90
!
! If the file does not exist create it.
!
! To build your program first create a build directory, eg. build and change into it
! > mkdir build
! > cd build
! Now, to configure the build you run
! > cmake ..
! Which creates the build files (Makefiles etc.) needed to build and test your program.
! Now build your program with
! > make
! If your build is successfull run the test
! > ctest -V
! If the build fails or the tests, modify the implementation in hello_world.f90 and rerun
! the "make" and the "ctest -V" commands.
!
! Now proceed to the test section and one test after the other, ensure your implementation
! passes this test.

program hello_world_test_main
  use TesterMain
  use hello_world

  implicit none

  ! The hello_world.f90 must contain a module called "hello_world" and implement
  ! the function "hello" which must return "Hello, World!".

  ! Test 1: Say Hi!
  ! Explaination: This test expects "Hello, World!" to be returned from the function "hello()"
  ! and the test description is "Say Hi!"
  call assert_equal("Hello, World!", hello(), "Say Hi!")

  ! This last call is to create a test report.
  call test_report()
end program

