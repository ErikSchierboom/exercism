module sieve
  implicit none

contains

  function primes(limit) result(array)
    integer, intent(in) :: limit
    integer, allocatable :: array(:)
    logical, allocatable :: sieve(:)
    integer :: i
    integer :: j

    allocate(sieve(limit + 1))

    do i = 2, size(sieve)
      sieve(i) = .TRUE.
    end do

    array = [integer::]

    do i = 2, int(sqrt(real(limit)))
      if (sieve(i)) then
        array = [array, i]
        do j = i**2, limit, i
          sieve(j) = .FALSE.
        end do
      end if
    end do

    do i = int(sqrt(real(limit))) + 1, limit
      if (sieve(i)) then
        array = [array, i]
      end if
    end do
  end function primes

end module sieve
