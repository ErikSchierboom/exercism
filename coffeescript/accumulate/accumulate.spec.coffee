require './accumulate'

describe '[].accumulate()', ->

  it 'empty accumulation', ->
    accumulator = (e) -> e * e
    expect([].accumulate(accumulator)).toEqual []

  xit 'accumulate squares', ->
    accumulator = (number) -> number * number
    expect([1, 2, 3].accumulate accumulator).toEqual [1, 4, 9]

  xit 'accumulate upcases', ->
    accumulator = (word) -> word.toUpperCase()
    result      = 'hello world'.split(/\s/).accumulate accumulator

    expect(result).toEqual ['HELLO', 'WORLD']

  xit 'accumulate reversed strings', ->
    accumulator = (word) -> word.split('').reverse().join('')
    result      = 'the quick brown fox etc'.split(/\s/).accumulate accumulator

    expect(result).toEqual ['eht', 'kciuq', 'nworb', 'xof', 'cte']

  xit 'accumulate recursively', ->
    result = 'a b c'.split(/\s+/).accumulate (char)  ->
      '1 2 3'.split(/\s+/).accumulate (digit) -> "#{char}#{digit}"

    expect(result).toEqual([['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['c1', 'c2', 'c3']])
