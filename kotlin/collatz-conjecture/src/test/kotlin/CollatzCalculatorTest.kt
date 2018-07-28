import org.junit.Ignore
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import kotlin.test.assertEquals

class CollatzCalculatorTest {

    @Rule
    @JvmField
    var expectedException: ExpectedException = ExpectedException.none()

    @Test
    fun testZeroStepsRequiredWhenStartingFrom1() {
        assertEquals(0, CollatzCalculator.computeStepCount(1))
    }

    
    @Test
    fun testCorrectNumberOfStepsWhenAllStepsAreDivisions() {
        assertEquals(4, CollatzCalculator.computeStepCount(16))
    }

    
    @Test
    fun testCorrectNumberOfStepsWhenBothStepTypesAreNeeded() {
        assertEquals(9, CollatzCalculator.computeStepCount(12))
    }

    
    @Test
    fun testAVeryLargeInput() {
        assertEquals(152, CollatzCalculator.computeStepCount(1000000))
    }

    
    @Test
    fun testZeroIsConsideredInvalidInput() {
        expectedException.expect(IllegalArgumentException::class.java)
        expectedException.expectMessage("Only natural numbers are allowed")

        CollatzCalculator.computeStepCount(0)
    }

    
    @Test
    fun testNegativeIntegerIsConsideredInvalidInput() {
        expectedException.expect(IllegalArgumentException::class.java)
        expectedException.expectMessage("Only natural numbers are allowed")

        CollatzCalculator.computeStepCount(-15)
    }

}
