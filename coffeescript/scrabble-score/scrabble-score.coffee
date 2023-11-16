class ScrabbleScore
  @letterScore: (letter) ->
    switch
      when letter in "AEIOULNRST" then 1
      when letter in "DG"         then 2 
      when letter in "BCMP"       then 3 
      when letter in "FHVWY"      then 4 
      when letter in "K"          then 5 
      when letter in "JX"         then 8 
      when letter in "QZ"         then 10
      else 0

  @score: (word) ->
    word.toUpperCase()
        .split("")
        .reduce(((score, letter) => score + @letterScore letter), 0)

module.exports = ScrabbleScore
