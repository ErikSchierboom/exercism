object AllYourBase {

  def rebase(from: Int, digits: List[Int], out: Int): Option[List[Int]] =
    if (from < 2 || out < 2)
      None
    else if (digits.isEmpty)
      Some(List())
    else {
      for {
        fromBase_ <- fromBase(from, digits)
        toBase_ <- toBase(out, fromBase_)
      } yield toBase_
    }

  def toBase(base: Int, number: Int): Option[List[Int]] =
    Some(unfoldLeft(number) {
      case 0 => None
      case n =>
        val digit = n % base
        val remainder = n / base
        Some(remainder, digit)
    })

  def fromBase(base: Int, digits: List[Int]): Option[Int] = {
    def validDigit(digit: Int) = if (digit < 0 || digit >= base) None else Some(digit)

    digits.foldLeft(Option(0)) {
      case (acc, digit) =>
        for {
          digit_ <- validDigit(digit)
          acc_ <- acc
        } yield acc_ * base + digit_
    }
  }

  def unfoldLeft[A, B](seed: B)(f: B => Option[(B, A)]) = {
    def loop(seed: B)(ls: List[A]): List[A] = f(seed) match {
      case Some((b, a)) => loop(b)(a :: ls)
      case None => ls
    }

    loop(seed)(Nil)
  }
}
