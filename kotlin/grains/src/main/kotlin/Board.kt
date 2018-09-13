import java.math.BigInteger

object Board {
    fun getGrainCountForSquare(square: Int): BigInteger {
        require(square >= 1 && square <= 64) { "Only integers between 1 and 64 (inclusive) are allowed" }

        return BigInteger("2").pow(square - 1)
    }

    fun getTotalGrainCount() = BigInteger("2").pow(64) - BigInteger("1")
}