import kotlin.math.pow

object ArmstrongNumber {
    fun check(input: Int): Boolean {
        val digits = input.digits()
        return digits.sumBy { it.pow(digits.size) } == input
    }

    private fun Int.digits() = this.toString().map { Character.getNumericValue(it) }

    private fun Int.pow(n: Int) = this.toDouble().pow(n).toInt()
}
