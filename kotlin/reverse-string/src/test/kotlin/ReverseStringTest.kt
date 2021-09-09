import org.junit.Ignore
import org.junit.Test
import kotlin.test.assertEquals

class ReverseStringTest {
    @Test
    fun `empty string`() = assertEquals("", reverse(""))

    @Test
    fun `single word`() = assertEquals("tobor", reverse("robot"))

    @Test
    fun `capitalized word`() = assertEquals("nemaR", reverse("Ramen"))

    @Test
    fun `sentence with punctuation`() = assertEquals("!yrgnuh m'I", reverse("I'm hungry!"))

    @Test
    fun `palindrome word`() = assertEquals("racecar", reverse("racecar"))

    @Test
    fun `even-sized word`() = assertEquals("reward", reverse("drawer"))

    @Test
    fun `apply twice`() {
        val input = "input"
        assertEquals(input, reverse(reverse(input)))
    }
}
