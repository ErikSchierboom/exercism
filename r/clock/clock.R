library(stringr)

new_clock <- function(hours, minutes) {
  total_minutes <- (hours * 60 + minutes) %% 1440
  
  structure(
    list(
      hours = total_minutes %/% 60,
      minutes = total_minutes %% 60
    ),
    class = "Clock"
  )
}

display <- function(clock) {
  hours <- str_pad(as.character(clock$hours), 2, pad = "0")
  minutes <- str_pad(as.character(clock$minutes), 2, pad = "0")
  paste(hours, minutes, sep = ":")
}

add <- function(clock, minutes) {
  new_clock(clock$hours, clock$minutes + minutes)
}

subtract <- function(clock, minutes) {
  new_clock(clock$hours, clock$minutes - minutes)
}

`==.Clock` <- function(clock1, clock2) {
  clock1$hours == clock2$hours && clock1$minutes == clock2$minutes
}
