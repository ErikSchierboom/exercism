object Sieve {

  def sieve(remainder: List[Int], primes: List[Int]): List[Int] =
    remainder match {
      case Nil => primes.reverse
      case prime::xs => sieve(xs.filter(x => x % prime > 0), prime :: primes)
    }

  def primesUpTo(max: Int) = sieve(List.range(2, max + 1), Nil)
}