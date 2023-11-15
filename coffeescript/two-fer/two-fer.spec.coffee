TwoFer = require './two-fer'

describe 'TwoFer', ->
  it 'no name give', ->
    expect(TwoFer.twoFer()).toEqual("One for you, one for me.")

  xit 'a name given', ->
    expect(TwoFer.twoFer("Alice")).toEqual("One for Alice, one for me.")

  xit 'another name given', ->
    expect(TwoFer.twoFer("Bob")).toEqual("One for Bob, one for me.")
