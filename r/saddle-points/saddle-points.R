saddle_point <- function(input) {
  row_max <- apply(input, 1, max, -Inf)
  col_min <- apply(input, 2, min, Inf)
  mask <- outer(row_max, col_min, FUN = "==")
  data.frame(which(mask, arr.ind = TRUE))
}
