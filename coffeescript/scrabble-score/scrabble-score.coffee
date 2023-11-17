class ScrabbleScore
  @letterScore: (letter) ->
    switch letter
      when 'A','E','I','O','U','L','N','R','S','T' then 1
      when 'D','G' then 2 
      when 'B','C','M','P' then 3 
      when 'F','H','V','W','Y' then 4 
      when 'K' then 5 
      when 'J','X' then 8 
      when 'Q','Z' then 10
      else 0

  @score: (word) ->
    word.toUpperCase()
        .split ""
        .reduce ((score, letter) => score + @letterScore letter), 0

module.exports = ScrabbleScore
