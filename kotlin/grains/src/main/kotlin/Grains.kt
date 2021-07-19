import java.math.BigInteger

object Board {
    fun getGrainCountForSquare(square: Int): BigInteger {
        require(square in 1..64) { "Only integers between 1 and 64 (inclusive) are allowed" }

        return 2.toBigInteger().pow(square - 1)
    }

    fun getTotalGrainCount() = 2.toBigInteger().pow(64) - 1.toBigInteger()
}