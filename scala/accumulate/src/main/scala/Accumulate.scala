class Accumulate {
  def accumulate[A, B](f: A => B, list: List[A]) = {
    def loop(remainder: List[A], acc: List[B]): List[B] =
      remainder match {
        case x :: xs => loop(xs, f(x) :: acc)
        case Nil => acc
      }

    loop(list, Nil).reverse
  }
}
