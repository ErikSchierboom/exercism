is_isogram <- function(word) {
  letters <- gsub("\\W", "", word) |> tolower() |> strsplit("") |> unlist()
  all(table(letters) == 1)
}
