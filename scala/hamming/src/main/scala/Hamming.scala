object Hamming {
  def compute(strand1: String, strand2: String): Int =
    (0 until Math.min(strand1.length, strand2.length)).foldLeft(0)((acc, i) => if (strand1(i) == strand2(i)) acc else acc + 1)
}
