class Series(private val series: String) {

    init {
        require(series.all(Char::isDigit))
    }

    fun getLargestProduct(span: Int): Long {
        require(span in 0..series.length)

        return series
            .map { Character.getNumericValue(it).toLong() }
            .slices(span)
            .map { it.product() }
            .max() ?: 1
    }

    private fun List<Long>.slices(span: Int) = 0.rangeTo(size - span).map { slice(it until it + span) }

    private fun List<Long>.product() = this.fold(1L, Long::times)
}