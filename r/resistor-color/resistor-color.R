colors <- c("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white") # nolint

color_code <- function(color) {
  match(color, colors) - 1
}
