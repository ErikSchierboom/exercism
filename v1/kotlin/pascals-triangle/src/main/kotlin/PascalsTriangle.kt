object PascalsTriangle {
    fun row(i: Int): List<Int> {
        val values = mutableListOf(1)
        var column = 1

        for (j in 1 .. i - 1) {
            column = column * (i - j) / j
            values.add(column)
        }

        return values;
    }

    fun computeTriangle(rows: Int): List<List<Int>> =
        if (rows < 0) throw IllegalArgumentException()
        else (1..rows).map { row(it) }
}