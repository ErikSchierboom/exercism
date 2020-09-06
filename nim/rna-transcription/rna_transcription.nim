import strutils

const Nucleotides = {'G', 'C', 'T', 'A'}

proc toRna*(dna: string): string =
  if not dna.allCharsInSet(Nucleotides):
    raise newException(ValueError, "Invalid nucleotide")

  dna.multiReplace(
    ("G", "C"),
    ("C", "G"),
    ("T", "A"),
    ("A", "U")
  )
