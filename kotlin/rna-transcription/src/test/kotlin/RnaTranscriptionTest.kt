import org.junit.Test
import org.junit.Ignore
import kotlin.test.assertEquals

class RnaTranscriptionTest {
    @Test
    fun `empty RNA` ()= assertEquals("", transcribeToRna(""))

    @Test
    fun `RNA complement of cytosine is guanine`() = assertEquals("G", transcribeToRna("C"))

    @Test
    fun `RNA complement of guanine is cytosine`() = assertEquals("C", transcribeToRna("G"))

    @Test
    fun `RNA complement of thymine is adenine`() = assertEquals("A", transcribeToRna("T"))

    @Test
    fun `RNA complement of adenine is uracil`() = assertEquals("U", transcribeToRna("A"))

    @Test
    fun `compound RNA`() = assertEquals("UGCACCAGAAUU", transcribeToRna("ACGTGGTCTTAA"))
}
