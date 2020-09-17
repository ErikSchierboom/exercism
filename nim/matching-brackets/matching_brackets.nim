import deques, sets, sequtils, tables

const Opening = toOrderedSet(['{', '(', '['])
const Closing = toOrderedSet(['}', ')', ']'])
const ClosingToOpening = zip(Closing.toSeq, Opening.toSeq).toTable

proc openingChar(c: char): char =
  ClosingToOpening[c]

proc isPaired*(str: string): bool =
  var unclosed = initDeque[char]()

  for c in str:
    if c in Closing and unclosed.len == 0:
      return false
    elif c in Closing and unclosed.peekLast != c.openingChar:
      return false
    elif c in Closing:
      unclosed.popLast()
    elif c in Opening:
      unclosed.addLast(c)

  unclosed.len == 0
