class Ocr(val input: String) {
  private val CharacterWidth = 3
  private val CharacterHeight = 4

  private lazy val lines = input.split("\n")
  private lazy val rows = lines.length / CharacterHeight
  private lazy val cols = lines(0).length / CharacterWidth

  lazy val convert = scanCharacters.mkString(",")

  private def scanCharacters = (0 until rows).map(row => (0 until cols).map(col => scanCharacter(row * CharacterHeight, col * CharacterWidth)).mkString)
  private def scanCharacter(row: Int, col: Int) = matchCharacter(character(row, col))
  private def character(row: Int, col: Int) = (0 until CharacterHeight).map(y => lines(row + y).drop(col).take(CharacterWidth)).mkString

  private def matchCharacter(character: String) =
    character match {
      case " _ | ||_|   " => "0"
      case "     |  |   " => "1"
      case " _  _||_    " => "2"
      case " _  _| _|   " => "3"
      case "   |_|  |   " => "4"
      case " _ |_  _|   " => "5"
      case " _ |_ |_|   " => "6"
      case " _   |  |   " => "7"
      case " _ |_||_|   " => "8"
      case " _ |_| _|   " => "9"
      case _              => "?"
    }
}

object Ocr {
  def apply(input: String) = new Ocr(input)
}
