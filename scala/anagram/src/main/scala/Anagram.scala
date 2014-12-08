class Anagram(val value: String) {
  lazy val permutations = value.toLowerCase.permutations.toSet - value

  private def isAnagram(s: String): Boolean = permutations.contains(s.toLowerCase)

  def matches(strings: Seq[String]): Seq[String] = strings.filter(isAnagram)
}