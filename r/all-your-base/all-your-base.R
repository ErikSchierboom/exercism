rebase <- function(input_base, digits, output_base) {
  if (input_base < 2) stop("input base must be >= 2")
  if (output_base < 2) stop("output base must be >= 2")
  if (any(digits < 0 | digits >= input_base)) stop("all digits must satisfy 0 <= d < input base")
  
  input_base_exponents <- (length(digits)-1):0
  number <- sum(digits * input_base^input_base_exponents)
  
  if (number == 0) return(0)
  
  output_base_exponents <- floor(log(number, output_base)):0
  number %/% output_base^output_base_exponents %% output_base
}
