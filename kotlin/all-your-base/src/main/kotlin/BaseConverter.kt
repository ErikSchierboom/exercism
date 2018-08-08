class BaseConverter(base: Int, numbers: IntArray) {
    private val baseNumber = numbers.fold(0) { acc, x -> acc * base + x }

    init {
        require(base >= 2) { "Bases must be at least 2." }
        require(numbers.isNotEmpty()) { "You must supply at least one digit." }
        require(numbers.size == 1 || numbers.first() != 0) { "Digits may not contain leading zeros." }
        require(numbers.all { it < base }) { "All digits must be strictly less than the base." }
        require(numbers.all { it >= 0 }) { "Digits may not be negative." }
    }

    fun convertToBase(targetBase: Int): IntArray {
        require(targetBase >= 2) { "Bases must be at least 2." }

        return when (baseNumber) {
            0 -> intArrayOf(0)
            else -> {
                val digits = mutableListOf<Int>()

                var remainder = baseNumber
                var multiplier = 1

                while (remainder > 0)
                {
                    multiplier *= targetBase

                    val value = remainder % multiplier
                    val digit = value/(multiplier/targetBase)

                    digits.add(digit)
                    remainder -= value
                }

                return digits.reversed().toIntArray()
            }
        }
    }
}