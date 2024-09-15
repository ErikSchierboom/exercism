library(tidyverse)

normalized_plaintext <- function(input) {
  gsub("\\W", "", tolower(input), perl = TRUE)
}

plaintext_segments <- function(input) {
  normalized <- normalized_plaintext(input)
  if (nchar(normalized) == 0) return("")
  
  cols <- ceiling(sqrt(nchar(normalized)))
  sapply(seq(1, nchar(normalized), by = cols), \(i) substr(normalized, i, i + cols - 1))
}

encoded <- function(input) {
  gsub("\\s", "", ciphertext(input), perl = TRUE)
}

ciphertext <- function(input) {
  segments <- plaintext_segments(input)
  padded_segments <- sapply(segments, str_pad, width = max(sapply(segments, nchar)), side = "right")
  transposed_segments <- transpose(sapply(padded_segments, strsplit, split = ""))
  sapply(transposed_segments, \(row) row |> paste0(collapse = "")) |> paste0(collapse = " ")
}
