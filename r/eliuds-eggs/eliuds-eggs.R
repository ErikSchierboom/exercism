egg_count <- function(display_value) {
  sum(intToBits(display_value) > 0)
}
