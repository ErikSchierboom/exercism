prime <- function(n) {
  stopifnot(n > 0)

  primes <- c(2, 3)
  current <- 6

  while (length(primes) < n) {
    limit <- sqrt(current + 1)
    prime_check <- primes[primes <= limit]

    if (all((current - 1) %% prime_check != 0)) {
      primes <- c(primes, current - 1)
    }

    if (all((current + 1) %% prime_check != 0)) {
      primes <- c(primes, current + 1)
    }

    current <- current + 6
  }

  primes[n]
}
