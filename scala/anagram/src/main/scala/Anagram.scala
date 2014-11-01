class Anagram(val value: String) {
  lazy val permutations = value.toLowerCase.permutations.toSet - value

  def matches(strings: Seq[String]): Seq[String] = strings.filter(s => permutations.contains(s.toLowerCase))
}