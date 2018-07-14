case class PalindromeProducts(minFactor: Int, maxFactor: Int) {
  def isPalindrome(n: Int) = {
    var current = n
    var result = 0

    while(current > 0) {
      result = result * 10 + current % 10
      current = current / 10
    }

    result == n
  }

  lazy val allPalindromes = for {
    y <- minFactor to maxFactor
    x <- minFactor to y
    if isPalindrome(x * y)
  } yield (x * y, (x, y))

  def palindrome(selection: Seq[Int] => Int) = {
    val value = selection(allPalindromes.map(_._1))
    val factors = allPalindromes.collect { case (product, factor) if product == value => factor }.sorted.toSet

    (value, factors)
  }

  lazy val largest = palindrome(seq => seq.max)

  lazy val smallest = palindrome(seq => seq.min)
}
