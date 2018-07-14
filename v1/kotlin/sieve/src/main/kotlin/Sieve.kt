object Sieve {
    fun primesUpTo(max: Int): List<Int> {
        var possiblePrimes = (2 .. max).toList()
        val primes = mutableListOf<Int>()

        do {
            val prime = possiblePrimes[0]
            primes.add(prime)

            possiblePrimes = possiblePrimes.filter { it % prime != 0 }.toMutableList()
        } while (!possiblePrimes.isEmpty())

        return primes
    }
}