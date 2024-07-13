success_rate <- function(speed) {
  if (speed == 0) return(0.0)
  if (speed <= 4) return(1.0)
  if (speed <= 8) return(0.9)
  if (speed == 9) return(.8)
  0.77
}

production_rate_per_hour <- function(speed) {
  221 * speed * success_rate(speed)
}

working_items_per_minute <- function(speed) {
  production_rate_per_hour(speed) %/% 60
}
