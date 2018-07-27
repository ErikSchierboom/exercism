class Luhn(input: Long) {
    val digits = input.toString().map { Integer.parseInt(it.toString()) }

    fun addend(index: Int, digit: Int) =
        if (index % 2 == 0) digit
        else if (digit >= 5) digit * 2 - 9
        else digit * 2

    val checkDigit: Int = (input % 10).toInt()
    val addends = digits.reversed().mapIndexed { i, j -> addend(i, j) }.reversed()
    val checksum = addends.sum()
    val isValid = checksum % 10 == 0

    val create: Long by lazy {
        val zeroCheckDigitNumber = input * 10
        val target = Luhn(zeroCheckDigitNumber)

        if (target.isValid) zeroCheckDigitNumber
        else zeroCheckDigitNumber + 10L - (target.checksum % 10)
    }
}