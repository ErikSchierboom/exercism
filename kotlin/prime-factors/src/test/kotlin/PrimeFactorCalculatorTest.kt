import org.junit.Ignore
import org.junit.Test
import kotlin.test.assertEquals

class PrimeFactorCalculatorTest {

    @Test
    fun testThat1HasNoPrimeFactors() {
        assertEquals(emptyList(), PrimeFactorCalculator.primeFactors(1))
    }

    @Test
    fun testThatAPrimeNumberHasExactlyOnePrimeFactor() {
        assertEquals(listOf(2), PrimeFactorCalculator.primeFactors(2))
    }

    @Test
    fun testThatASquareOfAPrimeHasExactlyOnePrimeFactorRepeatedTwice() {
        assertEquals(listOf(3, 3), PrimeFactorCalculator.primeFactors(9))
    }

    @Test
    fun testThatACubeOfAPrimeHasExactlyOnePrimeFactorRepeatedThreeTimes() {
        assertEquals(listOf(2, 2, 2), PrimeFactorCalculator.primeFactors(8))
    }

    @Test
    fun testThatAProductOfPrimesAndNonPrimesIsFactoredProperly() {
        assertEquals(listOf(2, 2, 3), PrimeFactorCalculator.primeFactors(12))
    }

    @Test
    fun testThatAProductOfSmallPrimesIsFactoredProperly() {
        assertEquals(listOf(5, 17, 23, 461), PrimeFactorCalculator.primeFactors(901255))
    }

    @Test
    fun testThatAProductOfSmallAndLargePrimesIsFactoredProperly() {
        assertEquals(listOf<Long>(11, 9539, 894119), PrimeFactorCalculator.primeFactors(93819012551L))
    }

}
