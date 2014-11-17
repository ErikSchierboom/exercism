class Scrabble {
  def letterValues = Map(
    1 -> Set('A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'),
    2 -> Set('D', 'G'),
    3 -> Set('B', 'C', 'M', 'P'),
    4 -> Set('F', 'H', 'V', 'W', 'Y'),
    5 -> Set('K'),
    8 -> Set('J', 'X'),
    10 -> Set('Q', 'Z')
  ).flatMap { case (value, letters) => letters.map(letter => (letter, value)) }

  def scoreLetter(letter: Char): Int = letterValues(letter.toUpper)
  def scoreWord(word: String): Int = word.map(scoreLetter).sum
}