object PascalsTriangle {
    fun computeTriangle(rows: Int): List<List<Int>> {
        require(rows >= 0) { "Rows can't be negative!" }
        return 1.rangeTo(rows).map(::row)
    }

    private fun row(i: Int) =
        sequence {
            var column = 1
            yield(column)

            for (j in 1 until i) {
                column = column * (i - j) / j
                yield(column)
            }
        }.toList()
}