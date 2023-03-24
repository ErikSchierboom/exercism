nucleotide_count <- function(input) {
  stopifnot(grepl("^[ACGT]*$", input))
  
  nucleotides <- unlist(strsplit(input, split=""))
  sapply(c('A', 'C', 'G', 'T'), function(nucleotide) { sum(nucleotide == nucleotides)} ) |> as.list()
}
