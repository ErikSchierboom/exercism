to_rna <- function(dna) {
  mapping <- c('G' = 'C', 'C' = 'G', 'T' = 'A', 'A' = 'U')
  nucleotides <- unlist(strsplit(dna, split = ""))
  
  stopifnot(all(nucleotides %in% names(mapping)))
  
  paste(mapping[nucleotides], collapse="")
}
