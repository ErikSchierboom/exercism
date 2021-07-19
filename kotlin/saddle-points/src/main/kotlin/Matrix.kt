data class MatrixCoordinate(val row: Int, val col: Int)

class Matrix(input: List<List<Int>>) {
    val saddlePoints: Set<MatrixCoordinate> by lazy {
        val rows = input.size
        val columns = input.getOrElse(0) { emptyList() }.size

        val rowMax = input.map { it.max() }
        val colMin = 0.until(columns).map { col -> 0.until(rows).map { row -> input[row][col] }.min() }

        1.rangeTo(rows)
            .flatMap { row -> 1.rangeTo(columns).map { col -> MatrixCoordinate(row, col) } }
            .filter { rowMax[it.row - 1] == colMin[it.col - 1] }
            .toSet()
    }
}