largest_series_product <- function(sequence, span) {
  stopifnot(span <= nchar(sequence))
  
  digits <- sequence |> strsplit("") |> unlist() |> as.integer()
  stopifnot(!anyNA(digits))
  
  max(sapply(1:(length(digits) - span + 1), \(i) prod(digits[i:(i + span - 1)])))
}
