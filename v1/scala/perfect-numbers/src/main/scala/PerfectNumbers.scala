object NumberType extends Enumeration {
  type NumberType = Value
  val Deficient, Perfect, Abundant = Value
}

object PerfectNumbers {
  private def sumOfFactors(n: Int) = (for (x <- 1 to n / 2 if n % x == 0) yield x).sum

  def classify(n: Int): NumberType.NumberType = {

    sumOfFactors(n) match {
      case x if x == n => NumberType.Perfect
      case x if x < n => NumberType.Deficient
      case _ => NumberType.Abundant
    }
  }
}