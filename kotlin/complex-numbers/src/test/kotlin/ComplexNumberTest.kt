import org.junit.Assert.assertEquals
import org.junit.Ignore
import org.junit.Test
import kotlin.math.*

class ComplexNumberTest {

    // Test helpers

    companion object {
        private const val DOUBLE_EQUALITY_TOLERANCE = 1e-15
    }

    private fun assertDoublesEqual(d1: Double, d2: Double) {
        assertEquals(d1, d2, DOUBLE_EQUALITY_TOLERANCE)
    }

    private fun assertComplexNumbersEqual(c1: ComplexNumber, c2: ComplexNumber) {
        assertDoublesEqual(c1.real, c2.real)
        assertDoublesEqual(c1.imag, c2.imag)
    }

    // Tests

    @Test
    fun testImaginaryUnitExhibitsDefiningProperty() {
        val expected = ComplexNumber(real = -1.0)
        val actual = ComplexNumber(imag = 1.0) * ComplexNumber(imag = 1.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testAdditionWithPurelyRealNumbers() {
        val expected = ComplexNumber(real = 3.0)
        val actual = ComplexNumber(real = 1.0) + ComplexNumber(real = 2.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testAdditionWithPurelyImaginaryNumbers() {
        val expected = ComplexNumber(imag = 3.0)
        val actual = ComplexNumber(imag = 1.0) + ComplexNumber(imag = 2.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testAdditionWithRealAndImaginaryParts() {
        val expected = ComplexNumber(real = 4.0, imag = 6.0)
        val actual = ComplexNumber(real = 1.0, imag = 2.0) + ComplexNumber(real = 3.0, imag = 4.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testSubtractionWithPurelyRealNumbers() {
        val expected = ComplexNumber(real = -1.0, imag = 0.0)
        val actual = ComplexNumber(real = 1.0, imag = 0.0) - ComplexNumber(real = 2.0, imag = 0.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testSubtractionWithPurelyImaginaryNumbers() {
        val expected = ComplexNumber(imag = -1.0)
        val actual = ComplexNumber(imag = 1.0) - ComplexNumber(imag = 2.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testSubtractionWithRealAndImaginaryParts() {
        val expected = ComplexNumber(real = -2.0, imag = -2.0)
        val actual = ComplexNumber(real = 1.0, imag = 2.0) - ComplexNumber(real = 3.0, imag = 4.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testMultiplicationWithPurelyRealNumbers() {
        val expected = ComplexNumber(real = 2.0)
        val actual = ComplexNumber(real = 1.0) * ComplexNumber(real = 2.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testMultiplicationWithPurelyImaginaryNumbers() {
        val expected = ComplexNumber(real = -2.0)
        val actual = ComplexNumber(imag = 1.0) * ComplexNumber(imag = 2.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testMultiplicationWithRealAndImaginaryParts() {
        val expected = ComplexNumber(real = -5.0, imag = 10.0)
        val actual = ComplexNumber(real = 1.0, imag = 2.0) * ComplexNumber(real = 3.0, imag = 4.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testDivisionWithPurelyRealNumbers() {
        val expected = ComplexNumber(real = 0.5)
        val actual = ComplexNumber(real = 1.0) / ComplexNumber(real = 2.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testDivisionWithPurelyImaginaryNumbers() {
        val expected = ComplexNumber(real = 0.5)
        val actual = ComplexNumber(imag = 1.0) / ComplexNumber(imag = 2.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testDivisionWithRealAndImaginaryParts() {
        val expected = ComplexNumber(real = 0.44, imag = 0.08)
        val actual = ComplexNumber(real = 1.0, imag = 2.0) / ComplexNumber(real = 3.0, imag = 4.0)
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testAbsoluteValueOfPositivePurelyRealNumber() {
        val expected = 5.0
        val actual = ComplexNumber(real = 5.0).abs
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testAbsoluteValueOfNegativePurelyRealNumber() {
        val expected = 5.0
        val actual = ComplexNumber(real = -5.0).abs
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testAbsoluteValueOfPurelyImaginaryNumberWithPositiveImaginaryPart() {
        val expected = 5.0
        val actual = ComplexNumber(imag = 5.0).abs
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testAbsoluteValueOfPurelyImaginaryNumberWithNegativeImaginaryPart() {
        val expected = 5.0
        val actual = ComplexNumber(imag = -5.0).abs
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testAbsoluteValueOfNumberWithRealAndImaginaryParts() {
        val expected = 5.0
        val actual = ComplexNumber(real = 3.0, imag = 4.0).abs
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testConjugationOfPurelyRealNumber() {
        val expected = ComplexNumber(real = 5.0)
        val actual = ComplexNumber(real = 5.0).conjugate()
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testConjugationOfPurelyImaginaryNumber() {
        val expected = ComplexNumber(imag = -5.0)
        val actual = ComplexNumber(imag = 5.0).conjugate()
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testConjugationOfNumberWithRealAndImaginaryParts() {
        val expected = ComplexNumber(real = 1.0, imag = -1.0)
        val actual = ComplexNumber(real = 1.0, imag = 1.0).conjugate()
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testRealPartOfPurelyRealNumber() {
        val expected = 1.0
        val actual = ComplexNumber(real = 1.0).real
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testRealPartOfPurelyImaginaryNumber() {
        val expected = 0.0
        val actual = ComplexNumber(imag = 1.0).real
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testRealPartOfNumberWithRealAndImaginaryParts() {
        val expected = 1.0
        val actual = ComplexNumber(real = 1.0, imag = 2.0).real
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testImaginaryPartOfPurelyRealNumber() {
        val expected = 0.0
        val actual = ComplexNumber(real = 1.0).imag
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testImaginaryPartOfPurelyImaginaryNumber() {
        val expected = 1.0
        val actual = ComplexNumber(imag = 1.0).imag
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testImaginaryPartOfNumberWithRealAndImaginaryParts() {
        val expected = 2.0
        val actual = ComplexNumber(real = 1.0, imag = 2.0).imag
        assertDoublesEqual(expected, actual)
    }

    @Test
    fun testExponentialOfPurelyImaginaryNumber() {
        val expected = ComplexNumber(real = -1.0)
        val actual = exponential(ComplexNumber(imag = PI))
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testExponentialOfZero() {
        val expected = ComplexNumber(real = 1.0)
        val actual = exponential(ComplexNumber())
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testExponentialOfPurelyRealNumber() {
        val expected = ComplexNumber(real = E)
        val actual = exponential(ComplexNumber(real = 1.0))
        assertComplexNumbersEqual(expected, actual)
    }

    @Test
    fun testExponentialOfANumberWithRealAndImaginaryPart() {
        val expected = ComplexNumber(real = -2.0)
        val actual = exponential(ComplexNumber(real = ln(2.0), imag = PI))
        assertComplexNumbersEqual(expected, actual)
    }

}
