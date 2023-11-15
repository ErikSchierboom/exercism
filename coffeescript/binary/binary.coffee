class Binary
  constructor: (@input) ->

  toDecimal: ->
    @input.split().reduce ((decimal, digit) -> decimal * 2 + parseInt(digit)), 0

module.exports = Binary
