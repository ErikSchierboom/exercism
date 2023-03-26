number_type <- function(n) {
  stopifnot(n > 0)

  if (n == 1) return("deficient")
  
  possible_factors <- 1:(n/2)
  factors <- possible_factors[n %% possible_factors == 0]
  aliquot_sum <- sum(factors)

  if (aliquot_sum < n) {
    "deficient"
  } else if (aliquot_sum > n) {
    "abundant"
  } else {
    "perfect"
  }
}
