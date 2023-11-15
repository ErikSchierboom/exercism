Hexadecimal = require './hexadecimal'

describe 'Hexadecimal', ->

  it 'hex 1 is decimal 1', ->
    hex = new Hexadecimal('1')
    expect(hex.toDecimal()).toEqual(1)

  xit 'hex c is decimal 12', ->
    hex = new Hexadecimal('c')
    expect(hex.toDecimal()).toEqual(12)

  xit 'hex 10 is decimal 16', ->
    hex = new Hexadecimal('10')
    expect(hex.toDecimal()).toEqual(16)

  xit 'hex af is decimal 175', ->
    hex = new Hexadecimal('af')
    expect(hex.toDecimal()).toEqual(175)

  xit 'hex 100 is decimal 256', ->
    hex = new Hexadecimal('100')
    expect(hex.toDecimal()).toEqual(256)

  xit 'hex 19ace is decimal 105166', ->
    hex = new Hexadecimal('19ace')
    expect(hex.toDecimal()).toEqual(105166)

  xit 'invalid hex is decimal 0', ->
    hex = new Hexadecimal('carrot')
    expect(hex.toDecimal()).toEqual(0)

  xit 'black', ->
    hex = new Hexadecimal('000000')
    expect(hex.toDecimal()).toEqual(0)

  xit 'white', ->
    hex = new Hexadecimal('ffffff')
    expect(hex.toDecimal()).toEqual(16777215)

  xit 'yellow', ->
    hex = new Hexadecimal('ffff00')
    expect(hex.toDecimal()).toEqual(16776960)
