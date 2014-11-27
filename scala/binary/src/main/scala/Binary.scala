case class Binary(str: String) {
  private def isValid = str.forall(c => c == '0' || c == '1')

  private def digitToDecimal(digitWithDecimal: (Char, Int)) = digitWithDecimal._1.asDigit * (1 << digitWithDecimal._2)
  private def digitsToDecimals = str.reverse.zipWithIndex.map(digitToDecimal)
  private def digitsToDecimal = digitsToDecimals.sum

  def toDecimal = if (isValid) digitsToDecimal else 0
}
