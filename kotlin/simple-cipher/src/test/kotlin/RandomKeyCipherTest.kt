import org.junit.Ignore
import org.junit.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotEquals
import kotlin.test.assertTrue

class RandomKeyCipherTest {

    @Test
    fun `can encode`() = with(Cipher()) {
        assertEquals(key.substring(0, 10), encode("aaaaaaaaaa"))
    }

    @Test
    fun `can decode`() = with(Cipher()) {
        assertEquals("aaaaaaaaaa", decode(key.substring(0, 10)))
    }

    @Test
    fun `key is made only of lowercase letters`() {
        assertTrue(Cipher().key.matches(Regex("[a-z]+")))
    }

    @Test
    fun `is reversible`() {
        val plainText = "abcdefghij"
        with(Cipher()) { assertEquals(plainText, decode(encode(plainText))) }
    }

    // extra tests

    @Test
    fun `default key is of length 100`() {
        assertEquals(100, Cipher().key.length)
    }

    @Test
    fun `two default generated keys differs`() {
        assertNotEquals(Cipher().key, Cipher().key)
    }

}
