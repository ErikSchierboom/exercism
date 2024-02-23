sieve <- function(limit) {
  if (limit < 2)
    return(c())
  
  numbers <- rep(TRUE, limit)
  numbers[1] <- FALSE
  
  for (i in 2:sqrt(limit))
    if (numbers[i] && i < limit)
      numbers[i*i:limit] <- FALSE
  
  which(numbers)
}
