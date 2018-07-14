class Squares {
  private def square(n: Int) = n * n

  def squareOfSums(n: Int) = square((1 to n).sum)
  def sumOfSquares(n: Int) = (1 to n).map(square).sum
  def difference(n: Int) = squareOfSums(n) - sumOfSquares(n)
}

object Squares {
  def apply() = new Squares()
}