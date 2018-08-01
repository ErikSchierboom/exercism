import org.junit.Test
import org.junit.Ignore
import kotlin.test.assertEquals

class SquaresTest {

    @Test
    fun squareOfSum1() {
        assertEquals(1, Squares(1).squareOfSum())
    }

    @Test
    fun squareOfSum5() {
        assertEquals(225, Squares(5).squareOfSum())
    }

    @Test
    fun squareOfSum100() {
        assertEquals(25502500, Squares(100).squareOfSum())
    }

    @Test
    fun sumOfSquares1() {
        assertEquals(1, Squares(1).sumOfSquares())
    }

    @Test
    fun sumOfSquares5() {
        assertEquals(55, Squares(5).sumOfSquares())
    }

    @Test
    fun sumOfSquares100() {
        assertEquals(338350, Squares(100).sumOfSquares())
    }

    @Test
    fun differenceOfSquares1() {
        assertEquals(0, Squares(1).difference())
    }

    @Test
    fun differenceOfSquares5() {
        assertEquals(170, Squares(5).difference())
    }

    @Test
    fun differenceOfSquares100() {
        assertEquals(25164150, Squares(100).difference())
    }

}
