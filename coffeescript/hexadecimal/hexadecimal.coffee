class Hexadecimal
  constructor: (@input) ->

  toDecimal: ->
    @input.split('').reduce ((decimal, char) ->
      if char.match(/[0-9a-f]/) then decimal * 16 + parseInt(char, 16) else 0), 0

module.exports = Hexadecimal
