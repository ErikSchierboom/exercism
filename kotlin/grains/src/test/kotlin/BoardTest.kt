import org.junit.Ignore
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import java.math.BigInteger
import kotlin.test.assertEquals

class BoardTest {

    @Rule
    @JvmField
    var expectedException: ExpectedException = ExpectedException.none()

    @Test
    fun testSquare1ContainsCorrectNumberOfGrains() {
        assertEquals(BigInteger.ONE, Board.getGrainCountForSquare(1))
    }

    
    @Test
    fun testSquare2ContainsCorrectNumberOfGrains() {
        assertEquals(BigInteger.valueOf(2), Board.getGrainCountForSquare(2))
    }

    
    @Test
    fun testSquare3ContainsCorrectNumberOfGrains() {
        assertEquals(BigInteger.valueOf(4), Board.getGrainCountForSquare(3))
    }

    
    @Test
    fun testSquare4ContainsCorrectNumberOfGrains() {
        assertEquals(BigInteger.valueOf(8), Board.getGrainCountForSquare(4))
    }

    
    @Test
    fun testSquare16ContainsCorrectNumberOfGrains() {
        assertEquals(BigInteger.valueOf(32768), Board.getGrainCountForSquare(16))
    }

    
    @Test
    fun testSquare32ContainsCorrectNumberOfGrains() {
        assertEquals(BigInteger.valueOf(2147483648), Board.getGrainCountForSquare(32))
    }

    
    @Test
    fun testSquare64ContainsCorrectNumberOfGrains() {
        assertEquals(BigInteger("9223372036854775808"), Board.getGrainCountForSquare(64))
    }

    
    @Test
    fun testSquare0IsInvalid() {
        expectedException.expect(IllegalArgumentException::class.java)
        expectedException.expectMessage("Only integers between 1 and 64 (inclusive) are allowed")

        Board.getGrainCountForSquare(0)
    }

    
    @Test
    fun testNegativeSquareIsInvalid() {
        expectedException.expect(IllegalArgumentException::class.java)
        expectedException.expectMessage("Only integers between 1 and 64 (inclusive) are allowed")

        Board.getGrainCountForSquare(-1)
    }

    
    @Test
    fun testSquareGreaterThan64IsInvalid() {
        expectedException.expect(IllegalArgumentException::class.java)
        expectedException.expectMessage("Only integers between 1 and 64 (inclusive) are allowed")

        Board.getGrainCountForSquare(65)
    }

    
    @Test
    fun testBoardContainsCorrectNumberOfGrains() {
        assertEquals(BigInteger("18446744073709551615"), Board.getTotalGrainCount())
    }

}
