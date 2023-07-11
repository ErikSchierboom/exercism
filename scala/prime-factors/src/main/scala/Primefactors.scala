object PrimeFactors {
  case class Accumulator(remaining: Long, factors: List[Long], factor: Long)

  def factors(n: Long): List[Long] = {
    def reduceForFactor(acc: Accumulator): Accumulator = {
      if (acc.remaining!= 0 && acc.remaining % acc.factor == 0) reduceForFactor(Accumulator(acc.remaining / acc.factor, acc.factor :: acc.factors, acc.factor))
      else acc
    }

    def go(acc: Accumulator): Accumulator = {
      if(acc.remaining <=1) acc
      else go(reduceForFactor(acc.copy(factor = acc.factor+1)))
    }

    go(Accumulator(n, List(), 1)).factors.reverse
  }
}