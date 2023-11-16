ScrabbleScore = require './scrabble-score'

describe 'ScrabbleScore', ->
  it 'lowercase letter', ->
    expect(ScrabbleScore.score('a')).toEqual(1)

  it 'uppercase letter', ->
    expect(ScrabbleScore.score('A')).toEqual(1)

  it 'valuable letter', ->
    expect(ScrabbleScore.score('f')).toEqual(4)

  it 'short word', -> 
    expect(ScrabbleScore.score('at')).toEqual(2)
  
  it 'short, valuable word', ->
    expect(ScrabbleScore.score('zoo')).toEqual(12)

  it 'medium word', ->
    expect(ScrabbleScore.score('street')).toEqual(6)

  it 'medium, valuable word', ->
    expect(ScrabbleScore.score('quirky')).toEqual(22)

  it 'long, mixed-case word', ->
    expect(ScrabbleScore.score('OxyphenButazone')).toEqual(41)

  it 'english-like word', ->
    expect(ScrabbleScore.score('pinata')).toEqual(8)

  it 'empty input', ->
    expect(ScrabbleScore.score('')).toEqual(0)

  it 'entire alphabet available', ->
    expect(ScrabbleScore.score('abcdefghijklmnopqrstuvwxyz')).toEqual(87)
