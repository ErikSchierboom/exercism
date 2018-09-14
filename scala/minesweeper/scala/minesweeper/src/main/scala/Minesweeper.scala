class Board(val board: List[String]) {

  val MineCharacter = '*'

  lazy val annotate: List[String] = (0 until board.length).map(row => (0 until board(row).length).map(col => cell(row, col)).mkString).toList

  private def cell(row: Int, col: Int) =
    if (isMine(row, col)) MineCharacter
    else {
      adjacentMinesCount(row, col) match {
        case 0 => ' '
        case x => x.toString
      }
    }

  private def isMine(row: Int, col: Int) = isValidRow(row) && isValidColumn(row, col) && board(row)(col) == MineCharacter
  private def isValidRow(row: Int) = row >= 0 && row < board.length
  private def isValidColumn(row: Int, col: Int) = col >= 0 && col < board(row).length

  private def adjacentPositions(row: Int, col: Int) = (-1 to 1).flatMap(y => (-1 to 1).map(x => (row + y, col + x))).filter((row, col) != _)

  private def adjacentMinesCount(row: Int, col: Int) = adjacentPositions(row, col).count(pos => isMine(pos._1, pos._2))
}

object Minesweeper {
  def annotate(board: List[String]) = new Board(board).annotate
}