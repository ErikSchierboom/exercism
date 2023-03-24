fizz_buzz <- function(n) {
  print <- function(n) {
    if (n %% 15 == 0) {
      "Fizz Buzz"
    } else if (n %% 3 == 0) {
      "Fizz"
    } else if (n %% 5 == 0) {
      "Buzz"
    } else {
      paste(n)
    }
  }
  
  sapply(1:n, print)
}
