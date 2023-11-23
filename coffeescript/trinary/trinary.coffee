class Trinary
  constructor: (@input) ->

  toDecimal: ->
    @input.split('').reduce ((decimal, char) -> if char.match(/[012]/) then decimal * 3 + parseInt(char) else 0), 0

module.exports = Trinary
