class PhoneNumber(val str: String) {

  lazy val number = str.filter(_.isDigit) match {
    case x if x.length == 11 && x(0) == '1' => x.substring(1)
    case x if x.length == 10 => x
    case _ => "0000000000"
  }

  lazy val areaCode = number.substring(0, 3)
  lazy val firstPartOfNumber = number.substring(3, 6)
  lazy val lastPartOfNumber = number.substring(6, 10)

  override def toString: String = s"($areaCode) $firstPartOfNumber-$lastPartOfNumber"
}