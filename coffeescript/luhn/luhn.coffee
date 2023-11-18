class Luhn
  constructor: (input) ->
    @digits = (parseInt char for char in input.replace(/\s/g, ''))

  valid: ->
    return false if @digits.length <= 1

    sum = 0

    for digit, index in @digits.reverse()
      return false if digit == NaN

      digit *= 2 if index % 2 == 1
      digit -= 9 if digit > 9

      sum += digit

    sum % 10 == 0

module.exports = Luhn
