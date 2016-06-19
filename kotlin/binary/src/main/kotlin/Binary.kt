object Binary {
    fun isValidChar(c: Char): Boolean = c in listOf('0', '1')

    fun charToDecimal(c: Char): Int = c - '0'

    fun toDecimal(input: String): Int =
        if (input.all { isValidChar(it) })
            input.fold(0) { acc, c -> acc * 2 + charToDecimal(c) }
        else
            0
}
