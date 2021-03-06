proc slices*(digits: string, length: int): seq[string] =
  if length < 1 or length > digits.len:
    raise newException(ValueError, "Invalid input")

  for i in 0 .. digits.len - length:
    result.add(digits[i ..< i + length])
