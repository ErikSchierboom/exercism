import org.assertj.core.api.Assertions.assertThat
import org.junit.Ignore
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException

class ChangeCalculatorTest {

    @Rule
    @JvmField
    var expectedException: ExpectedException = ExpectedException.none()

    @Test
    fun singleCoinChange() {
        val computedChange = ChangeCalculator(listOf(1, 5, 10, 25, 100)).computeMostEfficientChange(25)
        assertThat(computedChange).containsExactly(25)
    }

    @Test
    fun multipleCoinChange() {
        val computedChange = ChangeCalculator(listOf(1, 5, 10, 25, 100)).computeMostEfficientChange(15)
        assertThat(computedChange).containsExactly(5, 10)
    }

    @Test
    fun changeWithLilliputianCoins() {
        val computedChange = ChangeCalculator(listOf(1, 4, 15, 20, 50)).computeMostEfficientChange(23)
        assertThat(computedChange).containsExactly(4, 4, 15)
    }

    @Test
    fun changeWithLowerElboniaCoins() {
        val computedChange = ChangeCalculator(listOf(1, 5, 10, 21, 25)).computeMostEfficientChange(63)
        assertThat(computedChange).containsExactly(21, 21, 21)
    }

    @Test
    fun largeTargetValues() {
        val computedChange = ChangeCalculator(listOf(1, 2, 5, 10, 20, 50, 100)).computeMostEfficientChange(999)
        assertThat(computedChange)
                .containsExactly(2, 2, 5, 20, 20, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100)
    }

    @Test
    fun possibleChangeWithoutUnitCoinsAvailable() {
        val computedChange = ChangeCalculator(listOf(2, 5, 10, 20, 50)).computeMostEfficientChange(21)
        assertThat(computedChange).containsExactly(2, 2, 2, 5, 10)
    }

    @Test
    fun anotherPossibleChangeWithoutUnitCoinsAvailable() {
        val computedChange = ChangeCalculator(listOf(4, 5)).computeMostEfficientChange(27)
        assertThat(computedChange).containsExactly(4, 4, 4, 5, 5, 5)
    }

    @Test
    fun noCoinsMake0Change() {
        val computedChange = ChangeCalculator(listOf(1, 5, 10, 21, 25)).computeMostEfficientChange(0)
        assertThat(computedChange).isEmpty()
    }

    @Test
    fun errorTestingForChangeSmallerThanTheSmallestCoin() {
        val changeCalculator = ChangeCalculator(listOf(5, 10))

        expectedException.expect(IllegalArgumentException::class.java)
        expectedException.expectMessage("The total 3 cannot be represented in the given currency.")

        changeCalculator.computeMostEfficientChange(3)
    }

    @Test
    fun errorIfNoCombinationCanAddUpToTarget() {
        val changeCalculator = ChangeCalculator(listOf(5, 10))

        expectedException.expect(IllegalArgumentException::class.java)
        expectedException.expectMessage("The total 94 cannot be represented in the given currency.")

        changeCalculator.computeMostEfficientChange(94)
    }

    @Test
    fun cannotFindNegativeChangeValues() {
        val changeCalculator = ChangeCalculator(listOf(1, 2, 5))

        expectedException.expect(IllegalArgumentException::class.java)
        expectedException.expectMessage("Negative totals are not allowed.")

        changeCalculator.computeMostEfficientChange(-5)
    }

}
