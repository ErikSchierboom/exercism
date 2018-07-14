object Prime {
    fun nth(n: Int): Int {
        if (n < 1)
            throw IllegalArgumentException()

        return primes().elementAt(n - 1)
    }

    fun isPrime(n: Int): Boolean {
        val r = Math.floor(Math.sqrt(n.toDouble())).toInt()
        return r < 5 || (0 .. r - 4).all { n % (5 + it) != 0 }
    }

    fun possiblePrimes(): Sequence<Int> = generateSequence(1) { it + 1 }.flatMap { sequenceOf(it * 6 - 1, it * 6 + 1) }

    fun primes(): Sequence<Int> = sequenceOf(2, 3).plus(possiblePrimes().filter { isPrime(it) })
}