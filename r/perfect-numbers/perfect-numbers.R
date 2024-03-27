number_type <- function(n) {
  stopifnot(n > 0)

  candidates <- 1:(n/2)
  factors <- candidates[n %% candidates == 0]  
  aliquot_sum <- sum(factors[factors != n])

  if (aliquot_sum > n)
    "abundant"
  else if (aliquot_sum < n)
    "deficient"
  else
    "perfect"
}
