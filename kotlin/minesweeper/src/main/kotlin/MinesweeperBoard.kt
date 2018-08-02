class MinesweeperBoard(private val inputBoard: List<String>) {
    private val rows = inputBoard.size
    private val cols = if (inputBoard.size > 0) inputBoard[0].length else 0

    fun withNumbers() = inputBoard.mapIndexed(::renderRow)

    private fun renderRow(row: Int, str: String): String {
        fun renderCell(col: Int, cell: Char): Char {
            val numberOfMines = neighboringMines(row to col)
            return when {
                cell == '*' -> '*'
                numberOfMines == 0 -> ' '
                else -> numberOfMines.toString()[0]
            }
        }

        return str.mapIndexed(::renderCell).joinToString("")
    }

    private fun neighboringMines(coordinate: Pair<Int, Int>) = neighbors(coordinate).count(::isMine)

    private fun neighbors(coordinate: Pair<Int, Int>) =
        listOf(
                coordinate.first - 1 to coordinate.second - 1,
                coordinate.first to coordinate.second - 1,
                coordinate.first + 1 to coordinate.second - 1,
                coordinate.first - 1 to coordinate.second,
                coordinate.first + 1 to coordinate.second,
                coordinate.first - 1 to coordinate.second + 1,
                coordinate.first to coordinate.second + 1,
                coordinate.first + 1 to coordinate.second + 1)
                .filter(::validNeighbor)

    private fun validNeighbor(coordinate: Pair<Int, Int>) =
            coordinate.first >= 0 && coordinate.first < rows &&
            coordinate.second >= 0 && coordinate.second < cols

    private fun isMine(coordinate: Pair<Int, Int>) = inputBoard[coordinate.first][coordinate.second] == '*'
}