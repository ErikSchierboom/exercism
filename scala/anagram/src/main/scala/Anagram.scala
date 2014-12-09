class Anagram(val value: String) {
  lazy val upperCasedValue = value.toUpperCase
  lazy val sortedValue = upperCasedValue.sorted

  private def isAnagram(s: String): Boolean =
    s.toUpperCase.sorted == sortedValue &&
    s.toUpperCase != upperCasedValue

  def matches(strings: Seq[String]): Seq[String] = strings.filter(isAnagram)
}