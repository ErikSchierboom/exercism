class PhoneNumber(val str: String) {

  def number: String = str.filter(_.isDigit) match {
    case x if x.length == 11 && x(0) == '1' => x.substring(1)
    case x if x.length == 10 => x
    case _ => "0000000000"
  }

  def areaCode: String = number.substring(0, 3)
  def firstPartOfNumber: String = number.substring(3, 6)
  def lastPartOfNumber: String = number.substring(6, 10)

  override def toString: String = s"($areaCode) $firstPartOfNumber-$lastPartOfNumber"
}
