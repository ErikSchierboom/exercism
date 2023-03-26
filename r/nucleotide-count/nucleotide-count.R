nucleotide_count <- function(input) {
  stopifnot(grepl("^[ACGT]*$", input))
  
  nucleotides <- strsplit(input, split="")[[1]]
  sapply(c('A', 'C', 'G', 'T'), \(nucleotide) sum(nucleotide == nucleotides)) |> as.list()
}
