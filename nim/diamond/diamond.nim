import algorithm, sequtils, strformat, strutils

type
  LetterOffset = tuple
    letter: char
    offset: int

proc offsets(letters: seq[char]): seq[LetterOffset] =
  for i, c in letters:
    result.add((c, i))

  result.add(result[0..^2].reversed)

proc line(letterOffset: LetterOffset, letterCount: int): string =
  let (letter, offset) = letterOffset

  let outerSpaces = "".alignLeft(letterCount - offset - 1);
  let innerSpaces = "".alignLeft(if offset == 0: 0 else: offset * 2 - 1);

  if letter == 'A':
    &"{outerSpaces}{letter}{outerSpaces}\n"
  else:
    &"{outerSpaces}{letter}{innerSpaces}{letter}{outerSpaces}\n";

proc diamond*(letter: char): string =
  let letters = toSeq('A' .. letter)
  letters.offsets.mapIt(line(it, letters.len)).join()
