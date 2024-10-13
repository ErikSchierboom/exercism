encode <- function(rails, plaintext) {
  transform(rails, plaintext, \(i, fence) fence[i])
}

decode <- function(rails, ciphertext) {
  transform(rails, ciphertext, \(i, fence) match(i, fence))
}

transform <- function(rails, text, char_index) {
  chars <- strsplit(text, "") |> unlist()
  fence <- rail_fence(rails, length(chars))
  indices <- sapply(seq_along(chars), \(i) char_index(i, fence))
  chars[indices] |> paste0(collapse = "")
}

rail_fence <- function(rails, num_chars) {
  zigzag <- c(seq_len(rails), seq(rails - 1, 2))
  rep(zigzag, length.out = num_chars) |> order()
}
