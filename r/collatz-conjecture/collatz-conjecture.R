collatz_steps_count <- function(num, steps = 0) {
  if(num < 1) {
    stop("Input must be positive")
  } else if (num == 1) {
    steps
  } else if (num %% 2 == 0) {
    collatz_steps_count(num / 2, steps + 1)
  } else {
    collatz_steps_count(num * 3 + 1, steps + 1)
  }
}


collatz_step_counter <- function(num) {
  sapply(num, collatz_steps_count)
}

