is_paired <- function(input) {
  mapping <- list("{" = "}", "[" = "]", "(" = ")")
  expected <- list()

  for (c in strsplit(input, "") |> unlist()) {
    if (hasName(mapping, c)) {
      expected <- append(expected, mapping[c])
    } else if (c %in% mapping) {
      if (length(expected) == 0 || c != tail(expected, n = 1)) {
        return(FALSE)
      }

      expected <- expected[-length(expected)]
    }
  }

  length(expected) == 0
}
