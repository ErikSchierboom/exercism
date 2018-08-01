import org.junit.Test
import org.junit.Ignore
import org.junit.Rule
import org.junit.rules.ExpectedException
import kotlin.test.assertEquals

class PrimeTest {

    @Rule
    @JvmField
    var expectedException: ExpectedException = ExpectedException.none()

    @Test
    fun firstPrime() {
        assertEquals(2, Prime.nth(1))
    }

    @Test
    fun secondPrime() {
        assertEquals(3, Prime.nth(2))
    }

    @Test
    fun sixthPrime() {
        assertEquals(13, Prime.nth(6))
    }

    @Test
    fun bigPrime() {
        assertEquals(104743, Prime.nth(10001))
    }

    @Test
    fun undefinedPrime() {
        expectedException.expect(IllegalArgumentException::class.java)
        expectedException.expectMessage("There is no zeroth prime.")

        Prime.nth(0)
    }

}
