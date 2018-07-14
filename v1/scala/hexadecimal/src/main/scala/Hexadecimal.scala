object Hexadecimal {
  private lazy val hexCharacters = ('0' to '9') ++ ('a' to 'f')

  private def isHexCharacter(char: Char) = hexCharacters.contains(char)
  private def toHexValue(char: Char) = if (char.isDigit) char.asDigit else 10 + (char - 'a')
  private def isValid(hex: String) = hex.forall(isHexCharacter)

  def hexToInt(hex: String): Int = hex.toLowerCase match {
    case x if isValid(x) => x.foldLeft(0)((acc, char) => toHexValue(char) + (acc * 16))
    case _ => 0
  }
}