import org.junit.Test
import org.junit.Ignore
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class PangramTest {

    @Test
    fun emptySentence() {
        assertFalse(Pangram.isPangram(""))
    }

    @Test
    fun perfectLowercasePangram() {
        assertTrue(Pangram.isPangram("abcdefghijklmnopqrstuvwxyz"))
    }

    @Test
    fun lowercasePangram() {
        assertTrue(Pangram.isPangram("the quick brown fox jumps over the lazy dog"))
    }

    @Test
    fun missingCharacterX() {
        assertFalse(Pangram.isPangram("a quick movement of the enemy will jeopardize five gunboats"))
    }

    @Test
    fun anotherMissingCharacterX() {
        assertFalse(Pangram.isPangram("five boxing wizards jump quickly at it"))
    }

    @Test
    fun withUnderscores() {
        assertTrue(Pangram.isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog"))
    }

    @Test
    fun withNumbers() {
        assertTrue(Pangram.isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"))
    }

    @Test
    fun missingLettersReplacedByNumbers() {
        assertFalse(Pangram.isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))
    }

    @Test
    fun mixedCaseAndPunctuation() {
        assertTrue(Pangram.isPangram("\"Five quacking Zephyrs jolt my wax bed.\""))
    }

    @Test
    fun mixedCaseDuplicatedCharacters() {
        assertFalse(Pangram.isPangram("the quick brown fox jumps over with lazy FX"))
    }

}
