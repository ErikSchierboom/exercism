import org.junit.Before
import org.junit.Test
import org.junit.Ignore
import kotlin.test.assertEquals

class SubstitutionCipherTest {

    @Test
    fun `can encode`() = "abcdefghij".let { assertEquals(it, Cipher(it).encode("aaaaaaaaaa")) }

    @Test
    fun `can decode`() = "abcdefghij".let { assertEquals("aaaaaaaaaa", Cipher(it).decode(it)) }

    @Test
    fun `is reversible`() = with(Cipher("abcdefghij")) { assertEquals(key, decode(encode(key))) }

    @Test
    fun `can double shift encode`() =
        "iamapandabear".let { assertEquals("qayaeaagaciai", Cipher(it).encode(it)) }

    @Test
    fun `can wrap on encode`() =
        assertEquals("zabcdefghi", Cipher("abcdefghij").encode("zzzzzzzzzz"))

    @Test
    fun `can wrap on decode`() =
        assertEquals("zzzzzzzzzz", Cipher("abcdefghij").decode("zabcdefghi"))

    @Test
    fun `can encode messages longer than the key`() =
        assertEquals("iboaqcnecbfcr", Cipher("abc").encode("iamapandabear"))

    @Test
    fun `can decode messages longer than the key`() =
        assertEquals("iamapandabear", Cipher("abc").decode("iboaqcnecbfcr"))

    // extra tests

    @Test
    fun `keeps the given key`() = "abcdefghij".let { assertEquals(it, Cipher(it).key) }


}
