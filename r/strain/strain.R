keep <- function(input, fun) {
  if (is.null(input)) return(c())
  
  kept <- vector(mode = mode(input))
  
  for (element in input) {
    if (fun(element)) {
      kept[[length(kept) + 1]] <- element
    }
  }
  
  kept
}

discard <- function(input, fun) {
  keep(input, Negate(fun))
}
