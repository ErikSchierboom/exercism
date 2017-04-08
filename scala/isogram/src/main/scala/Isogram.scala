object Isogram {
  def isIsogram(input: String): Boolean = {
    val normalized = input.toLowerCase.filter(_.isLetter)
    normalized.distinct.length == normalized.length
  }
}