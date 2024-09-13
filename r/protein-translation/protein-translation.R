translations <- list(
  AUG = "Methionine",
  UUU = "Phenylalanine", UUC = "Phenylalanine",
  UUA = "Leucine", UUG = "Leucine",
  UCU = "Serine", UCC = "Serine", UCA = "Serine", UCG = "Serine",
  UAU = "Tyrosine", UAC = "Tyrosine",
  UGU = "Cysteine", UGC ="Cysteine",
  UGG = "Tryptophan",
  UAA = "STOP", UAG = "STOP", UGA = "STOP"
)

translate <- function(bases) {
  if (nchar(bases) == 0) return(NULL)
  
  proteins <- c()
  codons <- regmatches(bases, gregexpr("[[:upper:]]{1,3}", bases)) |> unlist()
  
  for (codon in codons) {
    if (nchar(codon) != 3) stop("Invalid codon")
    
    protein <- translations[[codon]]
    if (is.null(protein)) stop("Invalid codon")
    
    if (protein == "STOP") break
    proteins <- append(proteins, protein)
  }
  
  proteins
}
