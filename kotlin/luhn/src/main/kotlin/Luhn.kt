object Luhn {
    fun isValid(input: String) = input.sanitize().let {
        it.valid() && it.checksum() % 10 == 0
    }

    private fun String.sanitize() = replace(" ", "")
    private fun String.valid() = all(Char::isDigit) && length > 1
    private fun String.checksum() = addends().sum()
    private fun String.addends() = digits().mapIndexed { i, j ->
        when {
            (length - i + 1) % 2 == 0 -> j
            j >= 5 -> j * 2 - 9
            else -> j * 2
        }
    }
    private fun String.digits() = this.map(Char::digitToInt)
}