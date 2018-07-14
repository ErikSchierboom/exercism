fun <T> List<T>.windowed(span: Int) = (0 .. (this.size - span)).map { this.subList(it, it + span) }

class Series(input: String) {

    private val digits: List<Long>

    init {
        if (input.any { !Character.isDigit(it) })
            throw IllegalArgumentException()

        digits = input.map { it.toString().toLong() }
    }

    fun product(digits: List<Long>): Long = digits.fold(1L) { acc, l -> acc * l }

    fun getLargestProduct(span: Int): Long {
        if (span < 0 || span > digits.size)
            throw IllegalArgumentException()

        return digits.windowed(span).map { product(it) }.max() ?: 0
    }
}