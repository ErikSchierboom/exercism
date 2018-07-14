object PascalsTriangle {
  def row(i: Int) = (1 until i).scan(1) { case (acc, j) => acc * (i - j) / j }.toList

  def triangle(rows: Int): List[List[Int]] = (1 to rows).map(row).toList
}
