is_valid <- function(input) {
  input <- gsub(" ", "", input)
  
  if (!grepl("^\\d{2,}$", input))
    return(FALSE)
  
  digits <- rev(as.integer(strsplit(input, "")[[1]]))
  odd_numbers = seq(2, length(digits), by = 2)
  digits[odd_numbers] <- 2 * digits[odd_numbers]
  digits[digits > 9] <- digits[digits > 9] - 9
  sum(digits) %% 10 == 0
}
