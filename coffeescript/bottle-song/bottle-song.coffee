class BottleSong
  BOTTLE = 'green bottle'

  recite: (start, count) ->
    lines = []

    for i in [0...count]
      lines.push '' if i > 0
      lines.push(this.verse(start - i)...)

    lines

  verse: (num) ->
    [
      "#{this.bottlesOnTheWall num},",
      "#{this.bottlesOnTheWall num},",
      "And if one #{BOTTLE} should accidentally fall,",
      "There'll be #{this.bottlesOnTheWall(num - 1, true)}."
    ]

  bottlesOnTheWall: (count, lowerCase = false) ->
    countStr = this.numToString count
    countStr = countStr.toLowerCase() if lowerCase

    "#{countStr} #{BOTTLE}#{if count == 1 then '' else 's'} hanging on the wall"

  numToString: (num) ->
    switch num
      when 10 then 'Ten'
      when  9 then 'Nine'
      when  8 then 'Eight'
      when  7 then 'Seven'
      when  6 then 'Six'
      when  5 then 'Five'
      when  4 then 'Four'
      when  3 then 'Three'
      when  2 then 'Two'
      when  1 then 'One'
      when  0 then 'No'

module.exports = BottleSong
