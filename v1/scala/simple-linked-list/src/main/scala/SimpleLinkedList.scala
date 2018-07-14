trait SimpleLinkedList[T] {
  def isEmpty: Boolean
  def value: T
  def add(item: T): SimpleLinkedList[T]
  def next: SimpleLinkedList[T]
  def reverse: SimpleLinkedList[T]
  def toSeq: Seq[T]
}

case object Empty extends SimpleLinkedList[Any] {
  override def isEmpty: Boolean = true

  override def value: Any = throw new Exception

  override def add(item: Any): SimpleLinkedList[Any] = NonEmpty(item, Empty.asInstanceOf[SimpleLinkedList[Any]])

  override def next: SimpleLinkedList[Any] = throw new Exception

  override def reverse: SimpleLinkedList[Any] = Empty

  override def toSeq: Seq[Any] = Seq.empty
}

case class NonEmpty[T](_value: T, var _next: SimpleLinkedList[T]) extends SimpleLinkedList[T] {
  override def isEmpty: Boolean = false

  override def value: T = _value

  override def add(item: T): SimpleLinkedList[T] = {
    _next = _next.add(item)
    this
  }

  override def next: SimpleLinkedList[T] = _next

  override def reverse: SimpleLinkedList[T] = {
    def loop(previous: SimpleLinkedList[T], current: SimpleLinkedList[T]): SimpleLinkedList[T] = {
      current match {
        case NonEmpty(v: T, n: SimpleLinkedList[T]) => loop(NonEmpty(current.value, previous), n)
        case _ => previous
      }
    }

    loop(Empty.asInstanceOf[SimpleLinkedList[T]], this)
  }

  override def toSeq: Seq[T] = {
    def loop(acc: List[T], current: SimpleLinkedList[T]): List[T] = {
      current match {
        case NonEmpty(v: T, n: SimpleLinkedList[T]) => loop(v :: acc, n)
        case _ => acc.reverse
      }
    }

    loop(List(value), this._next)
  }
}

object SimpleLinkedList {
  def apply[T](): SimpleLinkedList[T] = Empty.asInstanceOf[SimpleLinkedList[T]]
  def apply[T](values: T*): SimpleLinkedList[T] = fromSeq(values)
  def fromSeq[T](values: Seq[T]): SimpleLinkedList[T] = values.foldLeft[SimpleLinkedList[T]](Empty.asInstanceOf[SimpleLinkedList[T]]) { case (acc, value) => acc.add(value)}
}