data class MatrixCoordinate(val row: Int, val col: Int)

class Matrix(input: List<List<Int>>) {
    val saddlePoints: Set<MatrixCoordinate> by lazy {
        val rowMax = input.map { it.maxOrNull() ?: 0 }
        val colMin = input.transpose().map { it.minOrNull() ?: 0 }

        rowMax.indices
            .flatMap { row -> colMin.indices.map { col -> MatrixCoordinate(row + 1, col + 1) } }
            .filter { rowMax[it.row - 1] == colMin[it.col - 1] }
            .toSet()
    }

    private fun List<List<Int>>.transpose() = first().indices.map { col -> map { it[col] } }
}