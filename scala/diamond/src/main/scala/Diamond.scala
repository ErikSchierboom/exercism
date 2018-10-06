object Diamond {
  def rows(letter: Char): List[String] = {
      def makeLine(letterCount: Int, indexedLetter: (Char, Int))=  {
        val (letter, row) = indexedLetter
        val outerSpaces  = "".padTo(letterCount - row - 1, " ").mkString
        val innerSpaces = "".padTo(if (row == 0) 0 else row * 2 - 1, " ").mkString

        if (letter == 'A') s"$outerSpaces$letter$outerSpaces"
        else s"$outerSpaces$letter$innerSpaces$letter$outerSpaces"
      }

    val letters = ('A' to letter).zipWithIndex
    val allLetters = letters ++ letters.reverse.tail
    allLetters.map(makeLine(letters.length, _)).toList
  }
}
