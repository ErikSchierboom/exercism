difference_of_squares <- function(natural_number) {
  numbers <- 1:natural_number
  sum(numbers)^2 - sum(numbers^2)
}
