object RailFenceCipher {
  def track(rails: Int, index: Int): Int = {
    val size = rails * 2 - 2
    def correct(i: Int): Boolean = i % size == 0

    if (correct(index)) 0
    else if (correct(index - rails + 1)) rails - 1
    else (1 to rails - 2).find(i => correct(index - i) || correct(index - size + i)).get
  }

  def encode(plainText: String, rails: Int): String = {
    val lettersByRail = (0 until plainText.length)
      .map(i => (track(rails, i), plainText.charAt(i)))
      .groupBy(_._1)

    lettersByRail
      .keys
      .toList
      .sorted
      .map(i => lettersByRail(i).map(a => a._2).mkString)
      .mkString
  }

  def decode(encodedText: String, rails: Int): String = {
    val railIndices = (0 until encodedText.length)
      .groupBy(i => track(rails, i))

    val letterIndices = railIndices
      .keys
      .toList
      .sorted
      .flatMap(railIndices(_))

    encodedText
      .zip(letterIndices)
      .sortBy(_._2)
      .map(_._1)
      .mkString
  }
}