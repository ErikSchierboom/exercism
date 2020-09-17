proc terminate(codon: string): bool =
  codon in ["UAA", "UAG", "UGA"]

proc toProtein(codon: string): string =
  case codon
  of "AUG": "Methionine"
  of "UUU", "UUC": "Phenylalanine"
  of "UUA", "UUG": "Leucine"
  of "UCU", "UCC", "UCA", "UCG": "Serine"
  of "UAU", "UAC": "Tyrosine"
  of "UGU", "UGC": "Cysteine"
  of "UGG": "Tryptophan"
  of "UAA", "UAG", "UGA": "STOP"
  else: raise newException(ValueError, "Invalid codon")

iterator codons(rna: string): string =
  for i in countup(0, rna.len - 1, 3):
    yield rna[i..i + 2]

proc translate*(rna: string): seq[string] =
  for codon in rna.codons:
    if codon.terminate:
      return

    result.add(codon.toProtein)
