class IsbnVerifier {
    fun isValid(isbn: String): Boolean {
        val normalizedIsbn = isbn.normalize()
        return isValidNumber(normalizedIsbn) && hasValidChecksum(normalizedIsbn)
    }

    private fun String.normalize() = this.replace("-", "")

    private fun isValidNumber(isbn: String) = isbn.matches("""^\d{9}(\d|X)$""".toRegex())

    private fun hasValidChecksum(isbn: String) =
            isbn.mapIndexed(::checksumDigitValue).sum().rem(11) == 0

    private fun checksumDigitValue(index: Int, char: Char) = char.toDigit() * (10 - index)

    private fun Char.toDigit() = if (this == 'X') 10 else Character.getNumericValue(this)
}