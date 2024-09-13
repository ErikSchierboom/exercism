acronym <- function(input) {
  strsplit(input, " |-") |> 
    unlist() |> 
    gsub("^_|_$", "", x = _) |> 
    substr(1, 1) |> 
    toupper() |> 
    paste(collapse = "")
}