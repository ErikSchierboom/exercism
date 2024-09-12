is_valid <- function(input) {
  digits <- gsub(" ", "", input)  |> strsplit("") |> unlist() |> as.numeric() |> suppressWarnings() |> rev()
  
  if (length(digits) < 2 | any(is.na(digits)))
    return(FALSE)
  
  odd_numbers = seq(2, length(digits), by = 2)
  digits[odd_numbers] <- 2 * digits[odd_numbers]
  digits[digits > 9] <- digits[digits > 9] - 9
  
  sum(digits) %% 10 == 0
}
