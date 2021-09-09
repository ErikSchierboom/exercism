import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class AtbashTest {

    private Atbash atbash;

    @Before
    public void setup() {
        atbash = new Atbash();
    }

    @Test
    public void testEncodeYes() {
        assertEquals("bvh", atbash.encode("yes"));
    }

    @Test
    public void testEncodeNo() {
        assertEquals("ml", atbash.encode("no"));
    }

    @Test
    public void testEncodeOmgInCapital() {
        assertEquals("lnt", atbash.encode("OMG"));
    }

    @Test
    public void testEncodeOmgWithSpaces() {
        assertEquals("lnt", atbash.encode("O M G"));
    }

    @Test
    public void testEncodeMindBlowingly() {
        assertEquals("nrmwy oldrm tob", atbash.encode("mindblowingly"));
    }

    @Test
    public void testEncodeNumbers() {
        assertEquals("gvhgr mt123 gvhgr mt", atbash.encode("Testing,1 2 3, testing."));
    }

    @Test
    public void testEncodeDeepThought() {
        assertEquals("gifgs rhurx grlm", atbash.encode("Truth is fiction."));
    }

    @Test
    public void testEncodeAllTheLetters() {
        assertEquals("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
                atbash.encode("The quick brown fox jumps over the lazy dog."));
    }

    @Test
    public void testDecodeExercism() {
        assertEquals("exercism", atbash.decode("vcvix rhn"));
    }

    @Test
    public void testDecodeASentence() {
        assertEquals("anobstacleisoftenasteppingstone", atbash.decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v"));
    }

    @Test
    public void testDecodeNumbers() {
        assertEquals("testing123testing", atbash.decode("gvhgr mt123 gvhgr mt"));
    }

    @Test
    public void testDecodeAllTheLetters() {
        assertEquals("thequickbrownfoxjumpsoverthelazydog",
                atbash.decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"));
    }
    
    @Test
    public void testDecodeWithTooManySpaces() {
        assertEquals("exercism", atbash.decode("vc vix    r hn"));
    }
    
    @Test
    public void testDecodeWithNoSpaces() {
        assertEquals("anobstacleisoftenasteppingstone",
                atbash.decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv"));
    }
}
