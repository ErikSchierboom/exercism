object Hamming {
  def compute(strand1: String, strand2: String): Int = strand1.zip(strand2).count { case (x, y) => x != y }
}