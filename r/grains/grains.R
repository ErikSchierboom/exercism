square <- function(n) {
  stopifnot(n %in% 1:64)
  
  2^(n-1)
}

total <- \() 2^64 - 1
