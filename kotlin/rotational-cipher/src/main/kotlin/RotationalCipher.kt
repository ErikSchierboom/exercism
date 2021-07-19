class RotationalCipher(rotations: Int) {
    private val map = ('a'..'z').shiftMap(rotations) +
                      ('A'..'Z').shiftMap(rotations)

    fun encode(text: String) = text.map { map.getOrDefault(it, it) }.joinToString("")

    private fun CharRange.shiftMap(n: Int) = zip(shift(n)).toMap()
    private fun CharRange.shift(n: Int) = drop(n) + take(n)
}