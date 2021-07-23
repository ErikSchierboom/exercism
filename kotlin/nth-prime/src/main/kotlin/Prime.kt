import kotlin.math.floor
import kotlin.math.sqrt

object Prime {
    fun nth(n: Int): Int {
        require(n > 0) { "There is no zeroth prime." }

        return primes().elementAt(n - 1)
    }

    private fun primes() = sequenceOf(2, 3).plus(possiblePrimes().filter { isPrime(it) })

    private fun possiblePrimes() = generateSequence(1) { it + 1 }.flatMap { sequenceOf(it * 6 - 1, it * 6 + 1) }

    private fun isPrime(n: Int): Boolean {
        val r = floor(sqrt(n.toDouble())).toInt()
        return r < 5 || (0 .. r - 4).all { n % (5 + it) != 0 }
    }
}