class BinarySearchTree
  constructor: (@data, @left = null, @right = null) ->

  insert: (data) ->
    if data <= @data
      @left?.insert(data) ? @left = new BinarySearchTree data
    else
      @right?.insert(data) ? @right = new BinarySearchTree data

  each: (callback) ->
    @left?.each callback
    callback @data
    @right?.each callback

module.exports = BinarySearchTree
