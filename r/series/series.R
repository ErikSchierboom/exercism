slices <- function(series, slice_length) {
  stopifnot(nchar(series) > 0 & slice_length %in% 1:nchar(series))
  
  slice_indices <- 1:(nchar(series) - slice_length + 1)
  sapply(slice_indices, function(i)
    substr(series, i, i + slice_length - 1))
}
