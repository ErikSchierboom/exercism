object PythagoreanTriplet {
  def square(x: Int) = x * x
  def squareRoot(x: Int) = Math.sqrt(x).toInt

  def sortTriplet(vector: (Int, Int, Int)) =
    vector match {
      case (x, y, z) =>
        val sorted = List(x, y, z).sorted
        (sorted(0), sorted(1), sorted(2))
    }

  def isPythagorean(vector: (Int, Int, Int)) = {
    val (x, y, z) = sortTriplet(vector)
    square(x) + square(y) == square(z)
  }

  def pythagoreanTriplets(min: Int, max: Int) =
    for {
      x <- min to max - 2
      y <- x until max
      target = square(x) + square(y)
      z = squareRoot(target)
      if z <= max && square(z) == target
    } yield (x, y, z)
}