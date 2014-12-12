import scala.annotation.tailrec

class PrimeFactors {
  def primeFactors(n: Long) = {

    def loop(remainder: Long, factor: Long, factors: List[Long]): List[Long] =
      remainder match {
        case x if x <= 1 => factors
        case x if x % factor == 0 => loop(remainder / factor, factor, factor :: factors)
        case x => loop(remainder, factor + 1, factors)
      }

    loop(n, 2, Nil).reverse
  }
}

object PrimeFactors {
  def apply() = new PrimeFactors
}
