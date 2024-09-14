library(stringr)

parse_phone_number <- function(number_string) {
  cleaned <- str_replace_all(number_string, "[\\(\\)\\.\\-\\s\\+]", "")
  
  digits <- cleaned |> strsplit("") |> unlist() |> as.numeric()
  
  if (any(is.na(digits))) return(NULL)
  
  if (length(digits) == 11) {
    if (digits[1] != 1) return(NULL)

    digits <- digits[-1]
  }
  
  if (length(digits) != 10 || digits[1] < 2 || digits[4] < 2)  return(NULL)

  digits |> paste(collapse = "")
}
