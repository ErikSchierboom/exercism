is_isogram <- function(word) {
  chars = strsplit(tolower(word), "")[[1]]
  letters_in_word = chars[chars %in% letters]
  length(letters_in_word) == length(unique(letters_in_word))
}
