matrix_row <- function(input, row_idx) {
  tbl <- read.table(text = input)
  tbl[row_idx, ] |> unlist() |> unname()
}

matrix_col <- function(input, col_idx) {
  tbl <- read.table(text = input)
  tbl[, col_idx] |> unlist() |> unname()
}
