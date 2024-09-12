to_digits <- function(num) {
  as.numeric(strsplit(as.character(num), "")[[1]])
}

is_armstrong_number <- function(n) {
  digits <- to_digits(n)
  sum(digits ^ length(digits)) == n
}
