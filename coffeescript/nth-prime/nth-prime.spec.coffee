Prime = require './nth-prime'

describe 'Prime', ->

  it 'first prime', ->
    prime = Prime.nth(1)
    expect(prime).toEqual(2)

  it 'second prime', ->
    prime = Prime.nth(2)
    expect(prime).toEqual(3)

  it 'sixth prime', ->
    prime = Prime.nth(6)
    expect(prime).toEqual(13)

  it 'big prime', ->
    prime = Prime.nth(10001)
    expect(prime).toEqual(104743)

  it 'there is no zeroth prime', ->
    expect(-> Prime.nth(0)).toThrow('Prime is not possible')
