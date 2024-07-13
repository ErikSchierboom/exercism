egg_count <- function(display_value) {
  count <- 0
  
  while (display_value > 0) {
    count <- count + bitwAnd(display_value, 1)
    display_value <- bitwShiftR(display_value, 1)
  }
  
  count
}
