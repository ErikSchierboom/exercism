trait Crumb[A]
case class LeftCrumb[A](value: A, tree: Option[BinTree[A]]) extends Crumb[A]
case class RightCrumb[A](value: A, tree: Option[BinTree[A]]) extends Crumb[A]

case class Zipper[A](value: A, left: Option[BinTree[A]], right: Option[BinTree[A]], crumbs: List[Crumb[A]])
case class BinTree[A](value: A, left: Option[BinTree[A]], right: Option[BinTree[A]])

object Zipper {
  def fromTree[A](bt: BinTree[A]): Zipper[A] = Zipper[A](bt.value, bt.left, bt.right, Nil)

  def toTree[A](zipper: Zipper[A]): BinTree[A] = {
    def loop(crumbs: List[Crumb[A]], t: BinTree[A]): BinTree[A] =
      crumbs match {
        case Nil => t
        case (LeftCrumb(tv, tr)::cs) => loop(cs, BinTree(tv, Some(t), tr))
        case (RightCrumb(tv, tl)::cs) => loop(cs, BinTree(tv, tl, Some(t)))
      }

    val tree = BinTree(zipper.value, zipper.left, zipper.right)
    loop(zipper.crumbs, tree)
  }

  def value[A](zipper: Zipper[A]): A = zipper.value

  def left[A](zipper: Zipper[A]): Option[Zipper[A]] =
    zipper.left.map(l => fromTree(l).copy(crumbs = LeftCrumb(zipper.value, zipper.right) :: zipper.crumbs))

  def right[A](zipper: Zipper[A]): Option[Zipper[A]] =
    zipper.right.map(r => fromTree(r).copy(crumbs = RightCrumb(zipper.value, zipper.left) :: zipper.crumbs))

  def up[A](zipper: Zipper[A]): Option[Zipper[A]] =
    zipper.crumbs match {
      case Nil => None
      case LeftCrumb(tv, tr)::cs => Some(Zipper(tv, Some(toTree(zipper)), tr, cs))
      case RightCrumb(tv, tl)::cs => Some(Zipper(tv, tl, Some(toTree(zipper)), cs))
    }

  def setValue[A](v: A, zipper: Zipper[A]): Zipper[A] =  zipper.copy(value = v)

  def setLeft[A](l: Option[BinTree[A]], zipper: Zipper[A]): Zipper[A] = zipper.copy(left = l)

  def setRight[A](r: Option[BinTree[A]], zipper: Zipper[A]): Zipper[A] = zipper.copy(right = r)
}