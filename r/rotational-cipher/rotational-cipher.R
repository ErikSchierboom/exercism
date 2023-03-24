rotate <- function(text, key) {
  rotated <- function(text) { c(tail(text, 26 - key), head(text, key)) }
  unchanged = c(0:9, " ", "'", "!", ",", ".")
  rotate_map = c(rotated(LETTERS), rotated(letters), unchanged)
  names(rotate_map) = c(LETTERS, letters, unchanged)
  
  chars <- text |> strsplit(split="") |> unlist()
  rotate_map[chars] |> paste(collapse = "")
}
