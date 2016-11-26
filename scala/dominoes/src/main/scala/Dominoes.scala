object Dominoes {

  private def validChain(dominoes: List[(Int, Int)]): Boolean =
    dominoes match {
      case Nil => true
      case (x, y)::Nil => x == y
      case (x1, y1)::(x2, y2)::xs => y1 == x2 && validChain((x1, y2)::xs)
    }

  private def rotations(dominoes: List[(Int, Int)]) =
    dominoes.indices.map(i => dominoes.drop(i) ++ dominoes.take(i))

  private def allPaths(dominoes: List[(Int, Int)]): List[List[(Int, Int)]] = {
    dominoes match {
      case Nil => Nil
      case x::Nil => List(List(x), List(x.swap))
      case x::xs => allPaths(xs)
        .flatMap(path => rotations(x::path) ++ rotations(x.swap::path))
    }
  }

  def chain(dominoes: List[(Int, Int)]): Option[List[(Int, Int)]] =
    dominoes match {
      case Nil => Some(Nil)
      case xs => allPaths(dominoes).find(validChain)
    }
}
