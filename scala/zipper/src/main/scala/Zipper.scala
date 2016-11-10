trait Crumb[A]
case class LeftCrumb[A](value: A, tree: Option[BinTree[A]]) extends Crumb[A]
case class RightCrumb[A](value: A, tree: Option[BinTree[A]]) extends Crumb[A]

case class Zipper[A](zValue: A, zLeft: Option[BinTree[A]], zRight: Option[BinTree[A]], zCrumbs: List[Crumb[A]])
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

    val tree = BinTree(zipper.zValue, zipper.zLeft, zipper.zRight)
    loop(zipper.zCrumbs, tree)
  }

  def value[A](zipper: Zipper[A]): A = zipper.zValue

  def left[A](zipper: Zipper[A]): Option[Zipper[A]] =
    zipper.zLeft match {
      case None => None
      case Some(l) => Some(Zipper(l.value, l.left, l.right, LeftCrumb(zipper.zValue, zipper.zRight) :: zipper.zCrumbs))
    }

  def right[A](zipper: Zipper[A]): Option[Zipper[A]] =
    zipper.zRight match {
      case None => None
      case Some(r) => Some(Zipper(r.value, r.left, r.right, RightCrumb(zipper.zValue, zipper.zLeft) :: zipper.zCrumbs))
    }

  def up[A](zipper: Zipper[A]): Option[Zipper[A]] =
    zipper.zCrumbs match {
      case Nil => None
      case LeftCrumb(tv, tr)::cs => Some(Zipper(tv, Some(toTree(zipper)), tr, cs))
      case RightCrumb(tv, tl)::cs => Some(Zipper(tv, tl, Some(toTree(zipper)), cs))
    }

  def setValue[A](v: A, zipper: Zipper[A]): Zipper[A] = Zipper[A](v, zipper.zLeft, zipper.zRight, zipper.zCrumbs)

  def setLeft[A](l: Option[BinTree[A]], zipper: Zipper[A]): Zipper[A] = Zipper[A](zipper.zValue, l, zipper.zRight, zipper.zCrumbs)

  def setRight[A](r: Option[BinTree[A]], zipper: Zipper[A]): Zipper[A] = Zipper[A](zipper.zValue, zipper.zLeft, r, zipper.zCrumbs)
}