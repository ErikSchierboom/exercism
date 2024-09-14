diamond <- function(letter) {
  ascii_a <- as.numeric(charToRaw("A"))
  ascii_letter <- as.numeric(charToRaw(letter))
  
  upwards <- ascii_a:ascii_letter |> as.raw() |> rawToChar() |> strsplit("") |> unlist()
  downwards <- upwards |> rev()
  
  vp <- append(upwards, downwards[-1])
  hp <- append(downwards, upwards[-1])
  
  sapply(vp, function(y) {
    sapply(hp, function(x) {
      ifelse(x == y, y, " ")
    }) |> paste(collapse = "")
  }) |> paste(collapse = "\n")
}
