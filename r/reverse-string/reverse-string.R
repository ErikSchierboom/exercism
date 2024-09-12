reverse <- function(text) {
  text |> charToRaw() |> rev() |> rawToChar()
}
