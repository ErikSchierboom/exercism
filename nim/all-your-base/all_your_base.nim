import algorithm, sequtils

proc fromInput(inputDigits: openArray[int], inputBase: int): int =
  for digit in inputDigits:
    result = result * inputBase + digit

proc toOutput(value: int, outputBase: int): seq[int] =
  var remainder = value
  var multiplier = 1

  while remainder > 0:
    multiplier *= outputBase

    let value = remainder mod multiplier
    let digit = value div (multiplier div outputBase)

    result.add digit
    remainder.dec value

  result.reverse

  if result.len == 0:
    result.add(0)

proc convert*(inputDigits: openArray[int], inputBase: int, outputBase: int): seq[int] =
  if inputBase < 2 or outputBase < 2 or inputDigits.anyIt(it < 0 or it >= inputBase):
    raise newException(ValueError, "Invalid bases")

  inputDigits.fromInput(inputBase).toOutput(outputBase)
