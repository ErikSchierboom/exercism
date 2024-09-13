create <- function(row, col) {
  stopifnot(row %in% 0:7 && col %in% 0:7)
  
  c(row, col)
}

can_attack <- function(queen1, queen2) {
  queen1[[1]] == queen2[[1]] ||
    queen1[[2]] == queen2[[2]] ||
    abs(queen1[[1]] - queen2[[1]]) == abs(queen1[[2]] - queen2[[2]])
}
