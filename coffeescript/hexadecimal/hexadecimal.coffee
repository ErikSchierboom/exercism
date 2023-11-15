class Hexadecimal
  constructor: (@input) ->

  toDecimal: ->
    @input.split().reduce ((decimal, digit) -> decimal * 16 + parseInt(digit)), 0

module.exports = Hexadecimal
