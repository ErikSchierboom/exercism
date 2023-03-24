to_rna <- function(dna) {
  stopifnot(grepl("^[GCTA]*$", dna))
  
  chartr("GCTA", "CGAU", dna)
}
