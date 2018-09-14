class Deque[T] {
  class Node(val value: T, var next: Option[Node], var prev: Option[Node]) {}

  var first: Option[Node] = None
  var last: Option[Node] = None

  def addToEmpty(newValue: T) = {
    val newElement = new Node(newValue, None, None)
    first = Some(newElement)
    last = Some(newElement)
  }

  def push(value: T) = last match {
    case Some(x) =>
      last = Some(new Node(value, x.next, last))
      x.next = last
    case None => addToEmpty(value)
  }

  def pop(): Option[T] = last match {
    case Some(x) =>
      last = x.prev
      Some(x.value)
    case None => None
  }

  def shift(): Option[T] = first match {
    case Some(x) =>
      first = x.next
      Some(x.value)
    case None => None
  }

  def unshift(value: T) = first match {
    case Some(x) =>
      first = Some(new Node(value, first, x.prev))
      x.prev = first
    case None => addToEmpty(value)
  }
}

object Deque {
  def apply[T]() = new Deque[T]
}