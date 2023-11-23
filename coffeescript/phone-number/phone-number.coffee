class PhoneNumber
  constructor: (@number) ->

  clean: ->
    digits = []

    for char in @number
      continue if char in '(). +-'

      throw new Error('letters not permitted') if /[a-z]/i.test(char)
      throw new Error('punctuations not permitted') if /[^\d]/.test(char)

      digits.push(char)

    throw new Error('must not be fewer than 10 digits') if digits.length < 10
    throw new Error('must not be more than 11 digits') if digits.length > 11
    throw new Error('11 digits must start with 1') if digits.length == 11 && digits[0] != '1'

    digits = digits[1..] if digits.length == 11

    throw new Error('area code cannot start with zero') if digits[0] == '0'
    throw new Error('area code cannot start with one') if digits[0] == '1'
    throw new Error('exchange code cannot start with zero') if digits[3] == '0'
    throw new Error('exchange code cannot start with one') if digits[3] == '1'

    digits.join('')        

module.exports = PhoneNumber
