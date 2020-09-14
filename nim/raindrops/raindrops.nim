proc convert*(number: int): string =
  if number mod 3 == 0: result.add("Pling")
  if number mod 5 == 0: result.add("Plang")
  if number mod 7 == 0: result.add("Plong")

  if result == "":
    result = $number
