import org.junit.Ignore
import org.junit.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class IsbnVerifierTest {
    @Test
    fun `valid | reguar isbn`() = assertValid("3-598-21508-8")

    @Test
    fun `invalid | check digit`() = assertInvalid("3-598-21508-9")

    @Test
    fun `valid | check digit is 10`() = assertValid("3-598-21507-X")

    @Test
    fun `invalid | check digit is character other than X`() = assertInvalid("3-598-21507-A")

    @Test
    fun `invalid | forbidden character`() = assertInvalid("3-598-P1581-X")

    @Test
    fun `invalid | X is only valid as check digit`() = assertInvalid("3-598-2X507-9")

    @Test
    fun `valid | without separating dashes`() = assertValid("3598215088")

    @Test
    fun `valid | without separating dashes and X as check digit`() = assertValid("359821507X")

    @Test
    fun `invalid | without check digit and dashes`() = assertInvalid("359821507")

    @Test
    fun `invalid | too long and no dashes`() = assertInvalid("3598215078X")

    @Test
    fun `invalid | too short`() = assertInvalid("00")

    @Test
    fun `invalid | without check digit`() = assertInvalid("3-598-21507")

    @Test
    fun `invalid | check digit of X is not used for 0`() = assertInvalid("3-598-21515-X")

    @Test
    fun `invalid | empty`() = assertInvalid("")

    @Test
    fun `invalid | input is 9 characters`() = assertInvalid("134456729")

    @Test
    fun `invalid | prohibited characters are not ignored`() = assertInvalid("3132P34035")

    @Test
    fun `invalid | too long but contains valid isbn`() = assertInvalid("98245726788")
}

private fun assertValid(isbn: String) = assertTrue(IsbnVerifier().isValid(isbn))

private fun assertInvalid(isbn: String) = assertFalse(IsbnVerifier().isValid(isbn))
