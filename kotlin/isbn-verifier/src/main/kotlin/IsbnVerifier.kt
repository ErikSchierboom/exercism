class IsbnVerifier {
    fun isValid(isbn: String) = isbn.normalized().let { it.hasValidFormat() && it.hasValidChecksum() }

    private fun String.normalized() = replace("-", "")
    private fun String.hasValidFormat() = matches("""^\d{9}(\d|X)$""".toRegex())
    private fun String.hasValidChecksum() = checksum().rem(11) == 0
    private fun String.checksum() = mapIndexed { i, c -> c.toDigit().times(10 - i) }.sum()

    private fun Char.toDigit() = if (this == 'X') 10 else Character.getNumericValue(this)
}