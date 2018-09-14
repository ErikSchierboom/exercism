object Series {
  def digits(str: String): List[Int] = str.map(_.asDigit).toList

  def slices(size: Int, str: String): List[List[Int]] =
    (0 to str.length - size).map(i => digits(str.substring(i, i + size))).toList

  def largestProduct(size: Int, str: String) = slices(size, str).map(_.product) match {
    case Nil => 1
    case xs => xs.max
  }
}