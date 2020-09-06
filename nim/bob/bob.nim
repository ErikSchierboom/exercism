import strutils

proc isShouting(sentence: string): bool =
  sentence.toUpperAscii == sentence and sentence.contains(Letters)

proc isQuestion(sentence: string): bool =
  sentence.strip.endsWith('?')

proc isSilence(sentence: string): bool =
  sentence.isEmptyOrWhitespace

proc hey*(sentence: string): string =
  if sentence.isSilence:
    "Fine. Be that way!"
  elif sentence.isShouting and sentence.isQuestion:
    "Calm down, I know what I'm doing!"
  elif sentence.isShouting:
    "Whoa, chill out!"
  elif sentence.isQuestion:
    "Sure."
  else:
    "Whatever."
