class PhoneNumber(input: String) {

    val number: String?

    init {
        val digits = input.filter(Char::isDigit)

        number = when {
            digits.length == 10 -> digits
            digits.length == 11 && digits[0] == '1' -> digits.slice(1 until digits.length)
            else -> null
        }?.let { if (it[0] in "01" || it[3] in "01") null else it }
    }
}