colors <- c("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white") # nolint

value <- function(resistor_colors) {
  sum((match(resistor_colors[1:2], colors) - 1) * c(10, 1))
}
