mapping <- setNames(c(letters, 0:9), c(rev(letters), 0:9))

encode <- function(plaintext) {
  chars <- plaintext |> tolower() |> strsplit("") |> unlist()
  mapped <- lapply(chars, \(c) mapping[c]) |> unlist() |> na.omit()
  grouped <- split(mapped, ceiling(seq_along(mapped) / 5))
  paste0(sapply(grouped, paste0, collapse = ""), collapse = " ")
}

decode <- function(ciphertext) {
  encode(ciphertext) |> gsub(pattern = " ", replacement = "")
}
