class Squares(private val number: Int) {
    fun squareOfSum() = 1.rangeTo(number).sum().square()
    fun sumOfSquares() = 1.rangeTo(number).sumBy { it.square() }
    fun difference() = squareOfSum() - sumOfSquares()

    private fun Int.square() = this * this
}