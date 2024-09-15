is_valid <- function(input) {
  digits <- gsub(" ", "", input)  |> strsplit("") |> unlist() |> as.numeric() |> rev()
  
  if (length(digits) < 2 | any(is.na(digits)))
    return(FALSE)
  
  odd_indexes = seq(2, length(digits), by = 2)
  digits[odd_indexes] <- 2 * digits[odd_indexes]
  digits[digits > 9] <- digits[digits > 9] - 9
  
  sum(digits) %% 10 == 0
}
