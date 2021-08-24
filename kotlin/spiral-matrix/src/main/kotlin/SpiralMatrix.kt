object SpiralMatrix {
    fun ofSize(size: Int): Array<IntArray> =
        0.until(size).map { row ->
            0.until(size).map { col ->
                spiralValue(size, 1, row, col) }.toIntArray() }.toTypedArray()

    private tailrec fun spiralValue(size: Int, startValue: Int, row: Int, col: Int): Int =
        when {
            row == 0 -> startValue + col
            col == size - 1 -> startValue + size + row - 1
            row == size - 1 -> startValue + size * 3 - 3 - col
            col == 0 -> startValue + size * 4 - 4 - row
            else -> spiralValue(size - 2, startValue + size * 4 - 4, row - 1, col - 1)
        }
}