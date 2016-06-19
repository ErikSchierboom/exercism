object Hexadecimal {
    fun isValidChar(c: Char): Boolean = c in '0' .. '9' || c in 'a' .. 'f'

    fun charToDecimal(c: Char): Int = if (Character.isDigit(c)) c - '0' else c - 'a' + 10

    fun toDecimal(input: String): Int {
        val normalizedInput = input.toLowerCase()

        if (normalizedInput.all { isValidChar(it) })
            return normalizedInput.fold(0) { acc, c -> acc * 16 + charToDecimal(c) }
        else
            return 0
    }
}
