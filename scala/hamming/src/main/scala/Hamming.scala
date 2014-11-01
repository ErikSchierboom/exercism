object Hamming {
  def compute(strand1: String, strand2: String): Int = {
    val sharedLength = Math.min(strand1.length, strand2.length)

    def compareNucleotide(index: Int) = if (strand1(index) == strand2(index)) 0 else 1
    def compareNucleotides(sum: Int, index: Int) = sum + compareNucleotide(index)

    (0 until sharedLength).foldLeft(0)(compareNucleotides)
  }
}
