import strutils

type
  Number = object
    billions: int
    millions: int
    thousands: int
    hundreds: int
    remainder: int

proc initNumber(n: int64): Number =
  var remainder = n

  result.billions = int(remainder div 1_000_000_000)
  remainder = remainder mod 1_000_000_000

  result.millions = int(remainder div 1_000_000)
  remainder = remainder mod 1_000_000

  result.thousands = int(remainder div 1_000)
  remainder = remainder mod 1_000

  result.hundreds = int(remainder div 100)
  result.remainder = int(remainder mod 100)

proc sayBelowTwenty(n: int): string =
  case n
    of 0: ""
    of 1: "one"
    of 2: "two"
    of 3: "three"
    of 4: "four"
    of 5: "five"
    of 6: "six"
    of 7: "seven"
    of 8: "eight"
    of 9: "nine"
    of 10: "ten"
    of 11: "eleven"
    of 12: "twelve"
    of 13: "thirteen"
    of 14: "fourteen"
    of 15: "fiveteen"
    of 16: "sixteen"
    of 17: "seventeen"
    of 18: "eighteen"
    of 19: "nineteen"
    else: raise newException(ValueError, "Number not below 20")

proc sayBelowHundred(n: int): string =
  proc say(base: string): string =
    let remainder = n mod 10
    if remainder == 0:
      base
    else:
      base & "-" & sayBelowTwenty(remainder)

  case n
    of 0..19: sayBelowTwenty(n)
    of 20..29: say("twenty")
    of 30..39: say("thirty")
    of 40..49: say("forty")
    of 50..59: say("fifty")
    of 60..69: say("sixty")
    of 70..79: say("seventy")
    of 80..89: say("eighty")
    of 90..99: say("ninety")
    else: raise newException(ValueError, "Number not below 100")

proc sayBelowThousand(n: int): seq[string] =
  let hundreds = n div 100
  let remainder = n mod 100
  
  if hundreds > 0:
    result.add(sayBelowTwenty(hundreds))
    result.add("hundred")

  if remainder > 0:
    result.add(sayBelowHundred(remainder))

proc parts(n: int64): seq[string] =
  let number = initNumber(n)

  if number.billions > 0:
    result.add(sayBelowThousand(number.billions))
    result.add("billion")

  if number.millions > 0:
    result.add(sayBelowThousand(number.millions))
    result.add("million")

  if number.thousands > 0:
    result.add(sayBelowThousand(number.thousands))
    result.add("thousand")

  if number.hundreds > 0:
    result.add(sayBelowHundred(number.hundreds))
    result.add("hundred")

  if number.remainder > 0:
    result.add(sayBelowHundred(number.remainder))

proc say*(n: int64): string =
  if n < 0 or n >= 1_000_000_000_000:
    raise newException(ValueError, "Invalid number")

  if n == 0:
    return "zero"

  parts(n).join(" ");
