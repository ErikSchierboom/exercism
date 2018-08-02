class Matrix(input: List<List<Int>>) {
    val saddlePoints: Set<MatrixCoordinate>

    init {
        val rows = input.size
        val columns = if (rows == 0) 0 else input[0].size

        val maximumPerRow = input.map { it.max() }
        val minimumPerColumn = (0 until columns).map { column -> (0 until rows).map { row -> input[row][column] }.min() }

        fun isSaddlePoint(coordinate: MatrixCoordinate) = maximumPerRow[coordinate.row] == minimumPerColumn[coordinate.col]

        val coordinates = (0 until rows).flatMap { row ->
            (0 until columns).map { col ->
                MatrixCoordinate(row, col)
            }
        }
        saddlePoints = coordinates.filter(::isSaddlePoint).toSet()
    }
}