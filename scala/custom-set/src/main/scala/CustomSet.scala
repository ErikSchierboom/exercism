class CustomSet[+T](input: List[T]) {
  val values = input.distinct
}

object CustomSet {
  def isEqual[T](set1: CustomSet[T], set2: CustomSet[T]) = set1.values.length == set2.values.length && set1.values.forall(member(set2, _))

  def isDisjointFrom[T](set1: CustomSet[T], set2: CustomSet[T]) = !set1.values.exists(member(set2, _))

  def isSubsetOf[T](set1: CustomSet[T], set2: CustomSet[T]) = set1.values.forall(member(set2, _))

  def member[T](set: CustomSet[T], value: T) = set.values.contains(value)

  def empty[T](set: CustomSet[T]) = set.values.isEmpty

  def insert[T](set: CustomSet[T], value: T) = new CustomSet[T](value :: set.values)

  def union[T](set1: CustomSet[T], set2: CustomSet[T]) = new CustomSet[T](set1.values ++ set2.values)

  def difference[T](set1: CustomSet[T], set2: CustomSet[T]) = fromList(set1.values.filter(!member(set2, _)))

  def intersection[T](set1: CustomSet[T], set2: CustomSet[T]) = fromList(set1.values.filter(member(set2, _)))

  def fromList[T](list: List[T]) = new CustomSet[T](list)
}