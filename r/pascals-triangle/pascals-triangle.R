pascals_triangle <- function(rows) {
  stopifnot(rows >= 0)
  
  if (rows == 0) return (list())
  
  lapply(1:rows, \(n) choose(n - 1, 0:(n - 1)))
}
