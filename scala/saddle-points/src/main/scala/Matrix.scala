case class Matrix(matrix: List[List[Int]]) {

  val rows = matrix.length
  val cols = matrix.headOption.map(_.length).getOrElse(0)

  val rowsMax = matrix.map(_.max)
  val colsMin = matrix.transpose.map(_.min)

  def rowMax(x: Int) = rowsMax(x)
  def colMin(y: Int) = colsMin(y)

  def element(x: Int, y: Int) = matrix(x)(y)
  def isSaddlePoint(x: Int, y: Int) = element(x, y) == rowMax(x) && element(x, y) == colMin(y)

  val points = for {
    x <- 0 until rows
    y <- 0 until cols
    if isSaddlePoint(x, y)
  } yield (x, y)

  val saddlePoints = points.toSet
}