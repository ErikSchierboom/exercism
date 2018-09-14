object Prime {

  def isPrime(n: Int) = {
    val r = Math.floor(Math.sqrt(n)).toInt
    r < 5 || (5 until r + 1).forall { x => n % x != 0 }
  }

  lazy val possiblePrimes = Stream.from(6, 6).flatMap(x => List(x - 1, x + 1))

  lazy val primes = 2 #:: 3 #:: possiblePrimes.filter(isPrime)

  def nth(n: Int) = primes(n - 1)
}