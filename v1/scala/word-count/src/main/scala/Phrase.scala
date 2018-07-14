class Phrase(val value: String) {
  lazy val wordRegex = """[\w']+""".r
  lazy val wordsInPhrase = (wordRegex findAllIn value.toLowerCase).toList
  lazy val groupedWords = wordsInPhrase.groupBy(identity)

  def wordCount: Map[String, Int] = groupedWords.map { case (word, words) => (word, words.length) }
}