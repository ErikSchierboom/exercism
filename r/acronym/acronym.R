acronym <- function(input) {
  words = strsplit(input, " |-")[[1]] |> gsub("^_|_$", "", x = _)
  words |> substr(1, 1) |> toupper() |> paste(collapse = "")
}