object Octal {

  def octalToInt(octal: String) = {
    require(octal.length > 0)
    require(octal.forall(_.asDigit < 8))

    octal.reverse.zipWithIndex.map { case (c, i) => octalDigit(c, i) }.sum
  }

  private def octalDigit(digit: Char, index: Int) = digit.asDigit * Math.pow(8, index)

  def intToOctal(decimal: Int) = octalDigits(decimal, Nil).mkString

  private def octalDigits(decimal: Int, digits: List[Int]): List[Int] =
    decimal / 8 match {
      case 0 => decimal :: digits
      case div => octalDigits(div, decimal % 8 :: digits)
    }
}