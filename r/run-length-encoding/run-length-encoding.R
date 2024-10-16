library(stringr)

encode <- function(plaintext) {
  runs <- str_match_all(plaintext, "(.)\\1*")[[1]]
  apply(runs, 1, encode_run) |> paste0(collapse = "")
}

encode_run <- function(run) {
  num_chars <- nchar(run[1])
  prefix <- ifelse(num_chars == 1, "", num_chars |> as.character())
  paste(prefix, run[2], sep = "")
}

decode <- function(ciphertext) {
  runs <- str_match_all(ciphertext, "(\\d+)?(.)")[[1]]
  apply(runs, 1, decode_run) |> paste0(collapse = "")
}

decode_run <- function(run) {
  count <- ifelse(is.na(run[2]), 1, run[2] |> as.numeric())
  str_dup(run[3], count)
}
