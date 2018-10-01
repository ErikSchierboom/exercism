object SpiralMatrix {
  def spiralMatrix(size: Int): List[List[Int]] =
    List.range(0, size).map(row =>
      List.range(0, size).map(col => spiralMatrixValue(size, 1, row, col)))

  private def spiralMatrixValue(size: Int, startValue: Int, row: Int, col: Int): Int = {
    (row, col) match {
      case (0, _) => startValue + col
      case _ if col == size - 1 => startValue + size + row - 1
      case _ if row == size - 1 => startValue + size * 3 - 3 - col
      case (_, 0) => startValue + size * 4 - 4 - row
      case _ => spiralMatrixValue(size - 2, startValue + size * 4 - 4, row - 1, col -1)
    }
  }
}
