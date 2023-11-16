class ScrabbleScore
  @score: (word) -> 
    word.toUpperCase()
        .split('')
        .map (letter) -> ScrabbleScore.letterScore letter
        .reduce ((score, letterScore) -> score + letterScore), 0
    
  @letterScore: (letter) ->
    return 1 if "AEIOULNRST".includes(letter)
    return 2 if "DG".includes(letter)
    return 3 if "BCMP".includes(letter)
    return 4 if "FHVWY".includes(letter)
    return 5 if "K".includes(letter)
    return 8 if "JX".includes(letter)
    return 10 if "QZ".includes(letter)

    0

module.exports = ScrabbleScore
