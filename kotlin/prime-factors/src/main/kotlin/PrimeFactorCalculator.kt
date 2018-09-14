import kotlin.coroutines.experimental.buildSequence

object PrimeFactorCalculator {
    fun primeFactors(number: Int): List<Int> = primeFactors(number.toLong()).map(Long::toInt)

    fun primeFactors(number: Long): List<Long> =
            buildSequence {
                var factor = 2L
                var remainder = number

                while (remainder > 1L) {
                    while (remainder.rem(factor) != 0L)
                        factor += if (factor == 2L) 1L else 2L

                    remainder /= factor

                    yield(factor)
                }
            }.toList()
}