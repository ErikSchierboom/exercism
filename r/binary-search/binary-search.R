find <- function(haystack, needle) {
  left <- 1
  right <- length(haystack)
  
  while (left <= right) {
    middle_idx <- (right + left) %/% 2
    middle <- haystack[middle_idx]  
    
    if (middle == needle) return(middle_idx)
    if (middle < needle) left <- middle_idx + 1
    else right <- middle_idx - 1
  }
  
  -1
}
