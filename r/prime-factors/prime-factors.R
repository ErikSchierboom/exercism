prime_factors <- function(n) {
  factors <- c()
  factor <- 2
  
  while (n > 1) {
    while (n %% factor != 0) {
      factor <- factor + ifelse(factor == 2, 1, 2)
    }

    n <- n / factor
    factors <- append(factors, factor)
  }
  
  factors
}
