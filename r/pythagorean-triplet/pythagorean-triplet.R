pythagorean_triplet <- function(n) {
  triplets = list()
  
  for (a in 1:(n/3-1)) {
    for (b in (a+1):((n-a)/2)) {
      c <- n - b - a
      if (a^2 + b^2 == c^2)
        triplets <- append(triplets, list(c(a, b, c)))
    }
  }
  
  triplets
}
