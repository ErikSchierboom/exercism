import tables

const CodonLen = 3

const CodonToProtein = {
  "AUG": "Methionine",
  "UUU": "Phenylalanine",
  "UUC": "Phenylalanine",
  "UUA": "Leucine",
  "UUG": "Leucine",
  "UCU": "Serine",
  "UCC": "Serine",
  "UCA": "Serine",
  "UCG": "Serine",
  "UAU": "Tyrosine",
  "UAC": "Tyrosine",
  "UGU": "Cysteine",
  "UGC": "Cysteine",
  "UGG": "Tryptophan"
}.toTable

proc toProtein(codon: string): string =
  CodonToProtein[codon]

proc terminate(codon: string): bool =
  codon in ["UAA", "UAG", "UGA"]

iterator codons(rna: string): string =
  for i in countup(0, rna.len - CodonLen, CodonLen):
    yield rna[i ..< i + CodonLen]

proc translate*(rna: string): seq[string] =
  for codon in rna.codons:
    if codon.terminate:
      return

    result.add(codon.toProtein)
