sieve <- function(limit) {
  if (limit < 2)
    return(c())
  
  numbers <- rep(TRUE, limit)
  numbers[1] <- FALSE
  
  for (i in 2:sqrt(limit))
    if (numbers[i] && i^2 < limit)
      numbers[seq(i^2, limit, i)] <- FALSE
  
  which(numbers)
}
