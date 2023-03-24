acronym <- function(input) {
  words = input |> strsplit(" |-") |> unlist() |> gsub("^_|_$", "", x = _)
  words |> substr(1, 1) |> toupper() |> paste(collapse = "")
}