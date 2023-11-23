class Node
  constructor: (@value, @prev, @next) ->

class LinkedList
  constructor: ->
    @count = 0
    @head = null
    @tail = null

  pushNode: (value) ->
    return this.addToEmpty value if @count == 0
    
    tail = @tail
    tail.next = @tail = new Node value, tail, tail.next
    @count++

  popNode: () ->
    return if @count == 0

    @count--
    tail = @tail
    @tail = tail.prev
    tail.value

  deleteNode: (value) ->
    node = @head

    while node != null
      if node.value == value
        node.next.prev = node.prev if node.next != null
        node.prev.next = node.next if node.prev != null

        @tail = node.prev if node == @tail
        @head = node.next if node == @head
        @count--
        break

      node = node.next

  shiftNode: (value) ->
    return if @count == 0

    @count--
    head = @head
    @head = @head.next
    head.value    

  unshiftNode: (value) ->
    return this.addToEmpty value if @count == 0
      
    head = @head
    head.prev = @head = new Node value, head.prev, head
    @count++

  countNodes: -> @count

  addToEmpty: (value) ->
    node = new Node value, null, null
    @head = node
    @tail = node
    @count++

module.exports = LinkedList
