children <- c(
  "Alice", "Bob", "Charlie", "David", "Eve", "Fred",
  "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"
)

encoding <- c(G = "Grass", C = "Clover", R = "Radish", V = "Violet")

plants <- function(garden, child) {
  sills <- strsplit(garden, "\n")[[1]] |>
    sapply(FUN = \(row) strsplit(row, "")[[1]])
  idx <- match(child, children) * 2 - 1
  encoding[sills[idx:(idx + 1), ]] |> unname()
}
