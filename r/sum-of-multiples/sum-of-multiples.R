sum_of_multiples <- function(factors, limit) {
  sum(Filter(function(n) { any(n %% factors == 0)}, 1:(limit-1)))
}
