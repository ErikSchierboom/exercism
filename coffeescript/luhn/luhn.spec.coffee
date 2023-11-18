Luhn = require './luhn'

describe 'Luhn', ->

  it 'single digit strings can not be valid', ->
    luhn = new Luhn('1')
    expect(luhn.valid()).toBe false

  it 'a single zero is invalid', ->
    luhn = new Luhn('0')
    expect(luhn.valid()).toBe false

  it 'a simple valid SIN that remains valid if reversed', ->
    luhn = new Luhn('059')
    expect(luhn.valid()).toBe true

  it 'a simple valid SIN that becomes invalid if reversed', ->
    luhn = new Luhn('59')
    expect(luhn.valid()).toBe true

  it 'a valid Canadian SIN', ->
    luhn = new Luhn('055 444 285')
    expect(luhn.valid()).toBe true

  it 'invalid credit card', ->
    luhn = new Luhn('8273 1232 7352 0569')
    expect(luhn.valid()).toBe false

  it 'invalid long number with an even remainder', ->
    luhn = new Luhn('1 2345 6789 1234 5678 9012')
    expect(luhn.valid()).toBe false

  it 'invalid long number with a remainder divisible by 5', ->
    luhn = new Luhn('1 2345 6789 1234 5678 9013')
    expect(luhn.valid()).toBe false

  it 'valid number with an even number of digits', ->
    luhn = new Luhn('095 245 88')
    expect(luhn.valid()).toBe true

  it 'valid number with an odd number of spaces', ->
    luhn = new Luhn('234 567 891 234')
    expect(luhn.valid()).toBe true

  it 'valid strings with a non-digit added at the end become invalid', ->
    luhn = new Luhn('059a')
    expect(luhn.valid()).toBe false

  it 'valid strings with punctuation included become invalid', ->
    luhn = new Luhn('055-444-285')
    expect(luhn.valid()).toBe false

  it 'valid strings with symbols included become invalid', ->
    luhn = new Luhn('055# 444$ 285')
    expect(luhn.valid()).toBe false

  it 'single zero with space is invalid', ->
    luhn = new Luhn(' 0')
    expect(luhn.valid()).toBe false

  it 'more than a single zero is valid', ->
    luhn = new Luhn('0000 0')
    expect(luhn.valid()).toBe true

  it 'input digit 9 is correctly converted to output digit 9', ->
    luhn = new Luhn('091')
    expect(luhn.valid()).toBe true

  it 'very long input is valid', ->
    luhn = new Luhn('9999999999 9999999999 9999999999 9999999999')
    expect(luhn.valid()).toBe true

  it 'valid luhn with an odd number of digits and non zero first digit', ->
    luhn = new Luhn('109')
    expect(luhn.valid()).toBe true

  it 'using ascii value for non-doubled non-digit isn\'t allowed', ->
    luhn = new Luhn('055b 444 285')
    expect(luhn.valid()).toBe false

  it 'using ascii value for doubled non-digit isn\'t allowed', ->
    luhn = new Luhn(':9')
    expect(luhn.valid()).toBe false

  it 'non-numeric, non-space char in the middle with a sum that\'s divisible by 10 isn\'t allowed', ->
    luhn = new Luhn('59%59')
    expect(luhn.valid()).toBe false
