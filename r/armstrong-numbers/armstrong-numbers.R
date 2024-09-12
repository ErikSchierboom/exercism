is_armstrong_number <- function(n) {
  digits <- n |> as.character() |> strsplit("") |> unlist() |> as.numeric()
  sum(digits ^ length(digits)) == n
}
