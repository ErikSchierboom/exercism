class Squares(val number: Int) {
    fun square(x: Int) = x * x

    fun squareOfSum(): Int = square((1 .. number).sum())

    fun sumOfSquares(): Int = (1 .. number).sumBy { square(it) }

    fun difference(): Int = squareOfSum() - sumOfSquares()
}