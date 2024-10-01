sum_of_multiples <- function(factors, limit) {
  is_factor <- \(n) { any(n %% factors == 0) }
  sum(Filter(is_factor, 1:(limit-1)))
}
