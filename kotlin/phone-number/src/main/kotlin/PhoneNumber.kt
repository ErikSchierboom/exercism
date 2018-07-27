class PhoneNumber(input: String) {
    val invalidNumber = "0000000000"

    val number: String
    val areaCode: String
    val middle: String
    val end: String

    init {
        val digits = input.filter { Character.isDigit(it) }

        if (digits.length == 10)
            number = digits
        else if (digits.length == 11 && digits[0] == '1')
            number = digits.slice(1 until digits.length)
        else
            number = invalidNumber

        areaCode = number.slice(0 .. 2)
        middle = number.slice(3 .. 5)
        end = number.slice(6 .. 9)
    }

    override fun toString(): String = "($areaCode) $middle-$end"
}