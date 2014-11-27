case class Binary(str: String) {
  def toDecimal = str.foldLeft[Option[Int]](Some(0)) {
    case (Some(acc), '0') => Some(acc * 2)
    case (Some(acc), '1') => Some(acc * 2 + 1)
    case _ => None
  }.getOrElse(0)
}
