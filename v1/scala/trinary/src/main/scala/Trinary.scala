object Trinary {
  def trinaryToInt(trinary: String): Int = {
    require(trinary.length > 0)
    require(trinary.forall(_.asDigit < 3))

    trinary.reverse.zipWithIndex.map { case (char, index) => char.asDigit * Math.pow(3, index).toInt }.sum
  }

  def intToTrinary(int: Int): String = trinaryDigits(int, Nil).mkString

  private def trinaryDigits(int: Int, digits: List[Int]): List[Int] =
    int / 3 match {
      case 0 => int :: digits
      case div => trinaryDigits(div, int % 3 :: digits)
    }
}
