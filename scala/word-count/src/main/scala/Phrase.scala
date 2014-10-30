class Phrase(val value: String) {
  def wordsInPhrase = ("""[\w']+""".r findAllIn value.toLowerCase).toList
  def groupedWords = wordsInPhrase.groupBy(identity)
  def wordCount: Map[String, Int] = groupedWords.map { case (word, words) => (word, words.length) }
}