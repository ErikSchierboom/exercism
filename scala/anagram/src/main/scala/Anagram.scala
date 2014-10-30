class Anagram(val value: String) {
  def matches(strings: Seq[String]): Seq[String] = {
    val anagrams = value.toLowerCase.permutations.toSet.intersect(strings.map(_.toLowerCase).toSet) - value

    strings.filter(s => anagrams.contains(s.toLowerCase)).toSeq
  }
}