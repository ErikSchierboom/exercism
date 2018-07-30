class Matrix(input: List<List<Int>>) {
    val saddlePoints: Set<MatrixCoordinate>

    init {
        val maximumPerRow = input.map { it.max() ?: Int.MAX_VALUE }
        val minimumPerColumn = input.transpose().map { it.min() ?: Int.MIN_VALUE }

        fun isSaddlePoint(coordinate: MatrixCoordinate): Boolean {
            val value = input[coordinate.row][coordinate.col]
            return value >= maximumPerRow[coordinate.row] && value <= minimumPerColumn[coordinate.col]
        }

        saddlePoints = input.coordinates().filter(::isSaddlePoint).toSet()
    }

    fun List<List<Int>>.rows(): Int = this.size

    fun List<List<Int>>.columns(): Int = if (this.isEmpty()) 0 else this[0].size

    fun List<List<Int>>.transpose(): List<List<Int>> {
        return (0 until this.rows()).map { row ->
            (0 until this.columns()).map { col ->
                this[col][row]
            }
        }
    }

    fun List<List<Int>>.coordinates(): List<MatrixCoordinate> {
        return (0 until this.rows()).flatMap { row ->
            (0 until this.columns()).map { col ->
                MatrixCoordinate(row, col)
            }
        }
    }
}