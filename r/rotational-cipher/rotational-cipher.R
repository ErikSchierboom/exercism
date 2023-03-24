rotate <- function(text, key) {
  rotated <- function(input) { c(tail(input, 26 - key), head(input, key)) }
  unchanged = c(0:9, " ", "'", "!", ",", ".")
  from = paste(c(LETTERS, letters, unchanged), collapse="")
  to = paste(c(rotated(LETTERS), rotated(letters), unchanged), collapse="")

  chartr(from, to, text)
}
