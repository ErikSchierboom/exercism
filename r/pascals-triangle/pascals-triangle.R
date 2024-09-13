pascals_triangle <- function(rows) {
  stopifnot(is.numeric(rows) && rows >= 0)
  
  if (rows == 0) return(list())
  lapply(0:(rows-1), \(n) sapply(0:n, choose, n = n))
}
