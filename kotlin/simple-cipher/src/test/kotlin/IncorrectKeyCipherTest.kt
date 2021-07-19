import org.junit.Test
import org.junit.Ignore

/**
 * Extra tests
 */
class IncorrectKeyCipherTest {

    @Test(expected = IllegalArgumentException::class)
    fun  `key cannot consist of upper cased letters`() {
        Cipher("ABCDEF")
    }

    @Test(expected = IllegalArgumentException::class)
    fun `key cannot contain upper cased letters`() {
        Cipher("abcdEFg")
    }

    @Test(expected = IllegalArgumentException::class)
    fun `key cannot consist of digits`() {
        Cipher("12345")
    }

    @Test(expected = IllegalArgumentException::class)
    fun `key cannot contain digits`() {
        Cipher("abcd345ef")
    }

    @Test(expected = IllegalArgumentException::class)
    fun `key cannot be empty`() {
        Cipher("")
    }
}
