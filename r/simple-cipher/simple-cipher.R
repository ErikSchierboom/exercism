generate_key <- function () {
  sample(letters, 100, replace = TRUE) |> paste0(collapse = "")
}

encode <- function(plaintext, key) {
  shift(plaintext, key, `+`)
}

decode <- function(ciphertext, key) {
  shift(ciphertext, key, `-`)
}

shift <- function(text, key, op) {
  text_idxs <- letter_idxs(text)
  key_idxs <- letter_idxs(key) |> rep_len(length.out = nchar(text))
  shifted_idxs <- op(text_idxs, key_idxs) %% 26 + 1
  letters[shifted_idxs] |> paste0(collapse = "")
}

letter_idxs <- function(text) {
  text |> strsplit("") |> unlist() |> sapply(FUN = letter_idx)
}

letter_idx <- function(letter) {
  utf8ToInt(letter) - utf8ToInt("a")
}
