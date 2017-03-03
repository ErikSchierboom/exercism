import org.junit.Ignore
import org.junit.Test

import org.junit.Assert.assertEquals

class NaturalNumberTest {

    @Test
    fun smallPerfectNumberIsClassifiedCorrectly() {
        assertEquals(Classification.PERFECT, classify(6))
    }

    
    @Test
    fun mediumPerfectNumberIsClassifiedCorrectly() {
        assertEquals(Classification.PERFECT, classify(28))
    }

    
    @Test
    fun largePerfectNumberIsClassifiedCorrectly() {
        assertEquals(Classification.PERFECT, classify(33550336))
    }

    
    @Test
    fun smallAbundantNumberIsClassifiedCorrectly() {
        assertEquals(Classification.ABUNDANT, classify(12))
    }

    
    @Test
    fun mediumAbundantNumberIsClassifiedCorrectly() {
        assertEquals(Classification.ABUNDANT, classify(24))
    }

    
    @Test
    fun largeAbundantNumberIsClassifiedCorrectly() {
        assertEquals(Classification.ABUNDANT, classify(33550335))
    }

    
    @Test
    fun smallDeficientNumberIsClassifiedCorrectly() {
        assertEquals(Classification.DEFICIENT, classify(8))
    }

    
    @Test
    fun mediumNumberIsClassifiedCorrectly() {
        assertEquals(Classification.DEFICIENT, classify(31))
    }

    
    @Test
    fun largeDeficientNumberIsClassifiedCorrectly() {
        assertEquals(Classification.DEFICIENT, classify(33550337))
    }

    
    @Test(expected = RuntimeException::class)
    fun mustProvideNaturalNumber() {
        assertEquals(Classification.DEFICIENT, classify(-1))
    }

}