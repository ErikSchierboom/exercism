square_root <- function(number) {
  stopifnot(number > 0)

  i <- 1
  result <- 1
  while (result <= number) {
    i <- i + 1
    result <- i^2
  }

  i - 1
}
