fizz_buzz <- function(n) {
  numbers <- 1:n
  numbers[which(1:n %% 3 == 0)] = "Fizz"
  numbers[which(1:n %% 5 == 0)] = "Buzz"
  numbers[which(1:n %% 15 == 0)] = "Fizz Buzz"
  numbers
}
