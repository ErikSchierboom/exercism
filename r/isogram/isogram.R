is_isogram <- function(word) {
  chars = word |> tolower() |> strsplit("") |> unlist()
  letters_in_word = chars[chars %in% letters]
  length(letters_in_word) == length(unique(letters_in_word))
}
