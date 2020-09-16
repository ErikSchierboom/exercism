import tables, strutils

proc countDna*(dna: string): CountTable[char] =
  if not dna.allCharsInSet({ 'A', 'C', 'G', 'T' }):
    raise newException(ValueError, "Invalid DNA string")

  dna.toCountTable()
