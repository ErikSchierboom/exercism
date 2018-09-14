case class Bst[T: Ordering](value: T, left: Option[Bst[T]], right: Option[Bst[T]]) {
  def insert(newValue: T): Bst[T] =
    if (Ordering[T].lteq(newValue, value))
      new Bst(value, insert(newValue, left), right)
    else
      new Bst(value, left, insert(newValue, right))

  private def insert(newValue: T, tree: Option[Bst[T]]): Option[Bst[T]] = tree match {
    case Some(branch) => Some(branch.insert(newValue))
    case None => Some(Bst(newValue))
  }
}

object Bst {
  def apply[T: Ordering](value: T): Bst[T] = new Bst(value, None, None)

  def fromList[T: Ordering](values: List[T]) = values match {
    case x :: xs => xs.foldLeft(Bst(x))((tree, value) => tree.insert(value))
    case Nil => throw new IllegalArgumentException("Cannot create tree from empty list")
  }

  def toList[T: Ordering](tree: Bst[T]): List[T] = toList(Some(tree))

  private def toList[T: Ordering](tree: Option[Bst[T]]): List[T] = tree match {
    case Some(x) => toList(x.left) ++ List(x.value) ++ toList(x.right)
    case None => Nil
  }
}