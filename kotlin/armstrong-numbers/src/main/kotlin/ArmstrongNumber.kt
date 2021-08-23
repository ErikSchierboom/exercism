import kotlin.math.pow

object ArmstrongNumber {
    fun check(input: Int) = input.armstrongSum() == input

    private fun Int.armstrongSum() = digits().run { sumOf { it.pow(size) } }
    private fun Int.digits() = toString().map(Char::digitToInt)
    private fun Int.pow(n: Int) = toDouble().pow(n).toInt()
}
