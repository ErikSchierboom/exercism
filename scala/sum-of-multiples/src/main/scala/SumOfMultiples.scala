object SumOfMultiples {
  def sumOfMultiples(numbers: List[Int], upperBound: Int): Int = {
    def isMultiple(x: Int) = numbers.exists { x % _ == 0 }

    (1 until upperBound).filter(isMultiple).sum
  }
}