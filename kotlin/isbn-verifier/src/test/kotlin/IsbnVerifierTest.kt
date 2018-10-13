import org.junit.Ignore
import org.junit.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class IsbnVerifierTest {
    private var isbnVerifier: IsbnVerifier = IsbnVerifier()

    @Test
    fun validIsbnNumber() {
        assertTrue(isbnVerifier.isValid("3-598-21508-8"))
    }

    
    @Test
    fun invalidIsbnCheckDigit() {
        assertFalse(isbnVerifier.isValid("3-598-21508-9"))
    }

    
    @Test
    fun validIsbnNumberWithCheckDigitOfTen() {
        assertTrue(isbnVerifier.isValid("3-598-21507-X"))
    }

    
    @Test
    fun checkDigitIsACharacterOtherThanX() {
        assertFalse(isbnVerifier.isValid("3-598-21507-A"))
    }

    
    @Test
    fun invalidCharacterInIsbn() {
        assertFalse(isbnVerifier.isValid("3-598-P1581-X"))
    }

    
    @Test
    fun xIsOnlyValidAsACheckDigit() {
        assertFalse(isbnVerifier.isValid("3-598-2X507-9"))
    }

    
    @Test
    fun validIsbnWithoutSeparatingDashes() {
        assertTrue(isbnVerifier.isValid("3598215088"))
    }

    
    @Test
    fun isbnWithoutSeparatingDashesAndXAsCheckDigit() {
        assertTrue(isbnVerifier.isValid("359821507X"))
    }

    
    @Test
    fun isbnWithoutCheckDigitAndDashes() {
        assertFalse(isbnVerifier.isValid("359821507"))
    }

    
    @Test
    fun tooLongIsbnAndNoDashes() {
        assertFalse(isbnVerifier.isValid("3598215078X"))
    }

    
    @Test
    fun isbnWithoutCheckDigit() {
        assertFalse(isbnVerifier.isValid("3-598-21507"))
    }

    
    @Test
    fun tooLongIsbn() {
        assertFalse(isbnVerifier.isValid("3-598-21507-XX"))
    }

    
    @Test
    fun checkDigitOfXShouldNotBeUsedForZero() {
        assertFalse(isbnVerifier.isValid("3-598-21515-X"))
    }

    
    @Test
    fun emptyIsbn() {
        assertFalse(isbnVerifier.isValid(""))
    }

    
    @Test
    fun inputIsNineCharacters() {
        assertFalse(isbnVerifier.isValid("134456729"))
    }

    
    @Test
    fun invalidCharactersAreNotIgnored() {
        assertFalse(isbnVerifier.isValid("3132P34035"))
    }
}