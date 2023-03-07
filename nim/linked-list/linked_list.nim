type
  Node[T] = ref object
    val: T
    prev: Node[T]
    next: Node[T]

  LinkedList*[T] = object
    first: Node[T]
    last: Node[T]

proc len*[T](list: LinkedList[T]): int =
  var current = list.first
  while current != nil:
    inc result
    current = current.next

proc push*[T](list: var LinkedList[T], val: T) =
  var node = Node[T](val: val, prev: list.last, next: nil)
  
  if node.prev != nil:
    node.prev.next = node

  if list.first == nil:
    list.first = node

  list.last = node

proc pop*[T](list: var LinkedList[T]): T =
  let popped = list.last
  list.last = popped.prev

  if list.last == nil:
    list.first = nil
  else:
    list.last.next = nil
   
  popped.val

proc shift*[T](list: var LinkedList[T]): T =
  let shifted = list.first
  list.first = shifted.next

  if list.first != nil:
    list.first.prev = nil
  else:
    list.last = nil
  
  shifted.val

proc unshift*[T](list: var LinkedList[T], val: T) =
  var node = Node[T](val: val, prev: nil, next: list.first)
   
  if node.next != nil:
    node.next.prev = node

  list.first = node

  if list.last == nil:
    list.last = node

proc delete*[T](list: var LinkedList[T], val: T) =
  var current = list.first
  while current != nil:
    if current.val == val:
      if current == list.first:
        list.first = current.next
      else:
        current.prev.next = current.next

      if current == list.last:
        list.last = current.prev
      else:
        current.next.prev = current.prev

      return

    current = current.next