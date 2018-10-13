object RotationalCipher {
  private val LOWERCASE_LETTERS = "abcdefghijklmnopqrstuvwxyz"
  private val UPPERCASE_LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  def rotate(text: String, shiftKey: Int): String =
    text.map(rotateLetter(shiftKey, _)).mkString

  private def keyForLetter(letter: Char) =
    if (letter.isLower) LOWERCASE_LETTERS else UPPERCASE_LETTERS

  private def rotateLetterUsingKey(shiftKey: Int, letter: Char, key: String): Char = {
    val shiftIndex = key.indexOf(letter) + shiftKey
    key(shiftIndex % key.length)
  }

  private def rotateLetter(shiftKey: Int, char: Char) =
    if (char.isLetter)
      rotateLetterUsingKey(shiftKey, char, keyForLetter(char))
    else
      char
}
