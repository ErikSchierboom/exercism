import kotlin.math.pow

object ArmstrongNumber {
    fun check(input: Int) = input.armstrongSum() == input

    private fun Int.armstrongSum() = digits().run { sumBy { it.pow(size) } }
    private fun Int.digits() = toString().map(Character::getNumericValue)
    private fun Int.pow(n: Int) = toDouble().pow(n).toInt()
}
