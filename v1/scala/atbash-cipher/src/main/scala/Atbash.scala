class Atbash {
  private def encodeChar(char: Char) = char match {
    case c if c.isLetter => ('a' + ('z' - c)).toChar
    case _ => char
  }

  def encode(input: String) = input.toLowerCase.filter(_.isLetterOrDigit).map(encodeChar).grouped(5).mkString(" ")
}

object Atbash {
  def apply() = new Atbash
}