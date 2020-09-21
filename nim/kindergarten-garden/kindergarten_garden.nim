import strutils

type
  Plant* = enum
    Grass = "G",
    Clover = "C",
    Radishes = "R",
    Violets = "V"

const children = [ "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

proc plants*(garden, child: string): seq[Plant] =
  let index = children.find(child) * 2
  
  for row in garden.splitLines:
    result.add(parseEnum[Plant]($row[index]))
    result.add(parseEnum[Plant]($row[index + 1]))
