class Raindrops {
  private def primeFactors(n: Int) = List(3, 5, 7).filter(n % _ == 0)
  private def primeFactorToString(prime: Int) = prime match {
    case 3 => "Pling"
    case 5 => "Plang"
    case 7 => "Plong"
    case _ => prime.toString
  }

  def convert(n: Int) = primeFactors(n) match {
    case Nil => n.toString
    case x => x.map(primeFactorToString).mkString
  }
}

object Raindrops {
  def apply() = new Raindrops
}
