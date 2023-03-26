number_type <- function(n) {
  stopifnot(n > 0)
  
  possible_factors <- if(n > 1) { 1:(n/2) } else { c() }
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
