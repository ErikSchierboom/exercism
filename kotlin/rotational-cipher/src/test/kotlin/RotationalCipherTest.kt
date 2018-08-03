import org.junit.Test
import kotlin.test.assertEquals

class RotationalCipherTest {

    @Test
    fun testRotateLowercaseABy0() {
        val cipher = RotationalCipher(0)
        assertEquals("a", cipher.encode("a"))
    }

    @Test
    fun testRotateLowercaseABy1NoWrapAround() {
        val cipher = RotationalCipher(1)
        assertEquals("b", cipher.encode("a"))
    }

    @Test
    fun testRotateLowercaseABy26SingleWrapAround() {
        val cipher = RotationalCipher(26)
        assertEquals("a", cipher.encode("a"))
    }

    @Test
    fun testRotateLowercaseMBy13NoWrapAround() {
        val cipher = RotationalCipher(13)
        assertEquals("z", cipher.encode("m"))
    }

    @Test
    fun testRotateLowercaseNBy1SingleWrapAround() {
        val cipher = RotationalCipher(13)
        assertEquals("a", cipher.encode("n"))
    }

    @Test
    fun testRotateCapitalLettersNoWrapAround() {
        val cipher = RotationalCipher(5)
        assertEquals("TRL", cipher.encode("OMG"))
    }

    @Test
    fun testSpacesAreUnalteredByRotation() {
        val cipher = RotationalCipher(5)
        assertEquals("T R L", cipher.encode("O M G"))
    }

    @Test
    fun testNumbersAreUnalteredByRotation() {
        val cipher = RotationalCipher(4)
        assertEquals("Xiwxmrk 1 2 3 xiwxmrk", cipher.encode("Testing 1 2 3 testing"))
    }

    @Test
    fun testPunctuationIsUnalteredByRotation() {
        val cipher = RotationalCipher(21)
        assertEquals("Gzo'n zvo, Bmviyhv!", cipher.encode("Let's eat, Grandma!"))
    }

    @Test
    fun testAllLettersRotateCorrectly() {
        val cipher = RotationalCipher(13)
        assertEquals(
                "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.",
                cipher.encode("The quick brown fox jumps over the lazy dog."))
    }

}
