import scala.annotation.tailrec

class Accumulate {
  def accumulate[A, B](f: A => B, list: List[A]) = {

    @tailrec
    def loop(remainder: List[A], acc: List[B]): List[B] =
      remainder match {
        case x :: xs => loop(xs, acc :+ f(x))
        case Nil => acc
      }

    loop(list, Nil)
  }
}
