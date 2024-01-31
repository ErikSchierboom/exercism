const numerals = block:
  const maxNumeral = 3999
  const numeralThresholds = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
    (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]

  func toNumeral(n: int): string =
    var remainder = n

    for (threshold, numeral) in numeralThresholds:
      while remainder div threshold > 0:
        result.add numeral
        remainder.dec threshold

  func genNumerals: array[maxNumeral + 1, string] =
    for n in 1..maxNumeral:
      result[n] = toNumeral(n)

  genNumerals()

proc roman*(n: int): string =
  numerals[n]
