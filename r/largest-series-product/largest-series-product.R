largest_series_product <- function(sequence, span) {
  stopifnot(span <= nchar(sequence))
  
  digits <- sequence |> strsplit("") |> unlist() |> as.numeric() |> suppressWarnings()
  stopifnot(!any(is.na(digits)))
  
  lapply(1:(length(digits) - span + 1), function(i)
    prod(digits[i:(i + span - 1)])) |> unlist() |> max()
}
