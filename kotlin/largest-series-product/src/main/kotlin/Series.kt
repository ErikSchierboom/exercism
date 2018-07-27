class Series(private val series: String) {

    init {
        require(series.all(Char::isDigit))
    }

    fun getLargestProduct(sliceLength: Int): Int {
        require(sliceLength >= 0)
        require(sliceLength <= series.length)

        return series.map(Character::getNumericValue)
                .slices(sliceLength)
                .map { it.product() }
                .max() ?: 1
    }

    private fun List<Int>.slices(sliceLength: Int) = (0 .. this.size - sliceLength).map { this.slice(it until it + sliceLength) }

    private fun List<Int>.product() = this.fold(1) { acc, i -> acc * i }
}