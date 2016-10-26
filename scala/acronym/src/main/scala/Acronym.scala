case class Acronym(phrase: String) {
  def acronymChar(str: String) = str(0).toUpper

  val pattern = "[A-Z]+[a-z]*|[a-z]+".r
  val words = pattern.findAllIn(phrase)
  val abbreviate = words.map(acronymChar).mkString
}
