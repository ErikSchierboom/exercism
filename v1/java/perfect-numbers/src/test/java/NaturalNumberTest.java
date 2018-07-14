import org.junit.Ignore;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public final class NaturalNumberTest {

    @Test
    public void testSmallPerfectNumberIsClassifiedCorrectly() {
        assertEquals(Classification.PERFECT, new NaturalNumber(6).getClassification());
    }

    
    @Test
    public void testMediumPerfectNumberIsClassifiedCorrectly() {
        assertEquals(Classification.PERFECT, new NaturalNumber(28).getClassification());
    }

    
    @Test
    public void testLargePerfectNumberIsClassifiedCorrectly() {
        assertEquals(Classification.PERFECT, new NaturalNumber(33550336).getClassification());
    }

    
    @Test
    public void testSmallAbundantNumberIsClassifiedCorrectly() {
        assertEquals(Classification.ABUNDANT, new NaturalNumber(12).getClassification());
    }

    
    @Test
    public void testMediumAbundantNumberIsClassifiedCorrectly() {
        assertEquals(Classification.ABUNDANT, new NaturalNumber(24).getClassification());
    }

    
    @Test
    public void testLargeAbundantNumberIsClassifiedCorrectly() {
        assertEquals(Classification.ABUNDANT, new NaturalNumber(33550335).getClassification());
    }

    
    @Test
    public void testSmallDeficientNumberIsClassifiedCorrectly() {
        assertEquals(Classification.DEFICIENT, new NaturalNumber(8).getClassification());
    }

    
    @Test
    public void testMediumNumberIsClassifiedCorrectly() {
        assertEquals(Classification.DEFICIENT, new NaturalNumber(31).getClassification());
    }

    
    @Test
    public void testLargeDeficientNumberIsClassifiedCorrectly() {
        assertEquals(Classification.DEFICIENT, new NaturalNumber(33550337).getClassification());
    }

}
