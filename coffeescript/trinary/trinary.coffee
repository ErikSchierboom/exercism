class Trinary
  constructor: (@input) ->

  toDecimal: ->
    @input.split().reduce ((decimal, digit) -> decimal * 3 + parseInt(digit)), 0

module.exports = Trinary
