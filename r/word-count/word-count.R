word_count <- function(sentence) {
  sentence <- tolower(sentence)
  words <- regmatches(sentence, gregexpr("\\w+('?\\w)*", sentence, perl = TRUE))
  words |> unlist() |> table() |> as.list()
}
