object FlattenArray {
  def flatten(list: List[Any]): List[Any] =
    list.flatMap {
      case a:List[Any] => flatten(a)
      case null => List()
      case x => List(x)
    }
}
