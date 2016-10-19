object AllYourBase {

  def rebase(from: Int, digits: List[Int], out: Int): Option[List[Int]] =
    if (from < 2 || out < 2)
      None
    else if (digits.isEmpty)
      Some(List())
    else
      fromBase(from, digits).flatMap(toBase(out, _))

  def toBase(base: Int, number: Int): Option[List[Int]] = {
    def loop(n: Int, acc: List[Int]): List[Int] = {
      if (n == 0) {
        acc
      }
      else {
        val digit = n % base
        val remainder = n / base
        loop(remainder, digit::acc)
      }
    }

    Some(loop(number, List.empty))
  }

  def fromBase(base: Int, digits: List[Int]): Option[Int] = {
    def loop(acc: Int, remainder: List[Int]): Option[Int] =
      remainder match {
        case List() => Some(acc)
        case digit::rest =>
            if (digit < 0)
              None
            else if (digit >= base)
              None
            else
              loop(acc * base + digit, rest)
      }

    digits match {
      case List() => None
      case _ => loop(0, digits)
    }
  }

}
