proc reverse*(str: string): string =
  for i in countdown(str.high, str.low):
    result.add(str[i])
