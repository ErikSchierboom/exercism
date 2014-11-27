class Sublist {
  def sublist[A](x: List[A], y: List[A]): Sublist.SublistType =
    if (x.equals(y)) Sublist.Equal
    else if (x.containsSlice(y)) Sublist.Superlist
    else if (y.containsSlice(x)) Sublist.Sublist
    else Sublist.Unequal
}

object Sublist {
  sealed abstract class SublistType
  case object Equal extends SublistType
  case object Unequal extends SublistType
  case object Sublist extends SublistType
  case object Superlist extends SublistType
}
