class Binary
  constructor: (@input) ->

  toDecimal: ->
    @input.split('').reduce ((decimal, char) -> if char.match(/[01]/) then decimal * 2 + parseInt(char) else 0), 0

module.exports = Binary
