object Sieve {
    fun primesUpTo(max: Int): List<Int> {
        tailrec fun helper(primes: List<Int>, possiblePrimes: List<Int>): List<Int> =
            when {
                possiblePrimes.isEmpty() -> primes
                else -> {
                    val prime = possiblePrimes.first()
                    val sievedPossiblePrimes = possiblePrimes.filter { it % prime != 0 }
                    helper(primes + prime, sievedPossiblePrimes)
                }
            }

        return helper(emptyList(), (2 .. max).toList())
    }
}