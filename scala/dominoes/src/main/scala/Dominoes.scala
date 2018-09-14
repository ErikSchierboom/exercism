object Dominoes {

  private def left(dominoes: List[(Int, Int)]) = dominoes.head._1
  private def right(dominoes: List[(Int, Int)]) = dominoes.last._2

  private def tryChainTo(path: List[(Int, Int)])(attach: ((Int, Int), List[(Int, Int)])): List[List[(Int, Int)]] =
    attach match {
      case ((a, b), rest) if b == left(path) => findChains(rest, (a, b) :: path)
      case ((a, b), rest) if a == left(path) => findChains(rest, (b, a) :: path)
      case _ => Nil
    }

  private def findChains(stones: List[(Int, Int)], path: List[(Int, Int)]): List[List[(Int, Int)]] =
    stones match {
      case Nil => if (left(path) == right(path)) List(path) else Nil
      case _ => rotations(stones).flatMap(tryChainTo(path))
    }

  private def rotations[A](ls: List[A]): List[(A, List[A])] =
    ls.indices.map(i => (ls.drop(i).head, ls.take(i) ++ ls.drop(i + 1))).toList

  def chain(dominoes: List[(Int, Int)]): Option[List[(Int, Int)]] =
    dominoes match {
      case Nil => Some(Nil)
      case first :: rest => findChains(rest, List(first)).headOption
    }
}