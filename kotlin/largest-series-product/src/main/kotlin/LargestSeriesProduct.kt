class Series(private val series: String) {
    init {
        require(series.all(Char::isDigit))
    }

    fun getLargestProduct(span: Int): Long {
        require(span in 0..series.length)

        return series
            .map { it.digitToInt().toLong() }
            .let { if (span == 0) emptyList() else it.windowed(span) }
            .maxOfOrNull { it.reduce(Long::times) } ?: 1L
    }
}